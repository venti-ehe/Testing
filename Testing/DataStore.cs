using System;
using System.Collections.Generic;
using System.Linq;

namespace Testing
{
    // ------------------------------------------------------------------
    //  Temporary IN-MEMORY storage for the Long Long Forum and the Survey.
    //  No XML files and no database yet: the forum starts with a few
    //  hard-coded sample discussions, and anything posted lives only until
    //  the app restarts / recompiles.
    //
    //  When you are ready for SQL, keep the public members below exactly as
    //  they are and replace only the bodies - the pages will not need to change.
    // ------------------------------------------------------------------

    public class ForumPost
    {
        public string Id { get; set; }
        public string ThreadId { get; set; }      // empty for a thread starter; the thread's Id for a reply
        public string Author { get; set; }
        public string Category { get; set; }
        public string Title { get; set; }
        public string Body { get; set; }
        public DateTime Created { get; set; }     // UTC
        public DateTime? Edited { get; set; }     // UTC
        public string OwnerToken { get; set; }    // browser token: only the author's browser may edit/delete
        public int ReplyCount { get; set; }       // filled in for thread starters
        public DateTime LastActivity { get; set; } // filled in for thread starters

        public bool IsReply { get { return !string.IsNullOrEmpty(ThreadId); } }
        public string Initial { get { return string.IsNullOrEmpty(Author) ? "?" : Author.Substring(0, 1).ToUpperInvariant(); } }
        public string Excerpt
        {
            get
            {
                string b = (Body ?? "").Replace("\r", " ").Replace("\n", " ").Trim();
                return b.Length > 150 ? b.Substring(0, 150).TrimEnd() + "\u2026" : b;
            }
        }

        public ForumPost Clone() { return (ForumPost)MemberwiseClone(); }
    }

    public static class ForumStore
    {
        public static readonly string[] Categories = { "General", "Build Help", "Parts & Pricing", "Show Your Build", "Troubleshooting" };

        private static readonly object Sync = new object();
        private static readonly List<ForumPost> Posts = CreateSeed();

        private static string Clip(string s, int max)
        {
            s = (s ?? "").Trim();
            return s.Length > max ? s.Substring(0, max) : s;
        }

        // ---------- hard-coded sample data ----------
        private static List<ForumPost> CreateSeed()
        {
            DateTime now = DateTime.UtcNow;
            string t1 = "welcome";
            string t2 = "first-build";
            string t3 = "ram-slots";

            return new List<ForumPost>
            {
                new ForumPost { Id = t1, ThreadId = "", Author = "Long Long Team", Category = "General",
                    Title = "Welcome to the Long Long Forum",
                    Body = "You made it through the whole BUILD//LAB course - well done!\n\nThis is the place to ask questions, share your build and help other builders. Please be kind, be specific, and mention which step you are on when you ask for help.",
                    Created = now.AddMinutes(-90), OwnerToken = "system" },

                new ForumPost { Id = t2, ThreadId = "", Author = "Long Long Team", Category = "Show Your Build",
                    Title = "Post your first finished build",
                    Body = "Finished the final assembly challenge? Tell us your parts list, how long it took and the one thing you wish you had known before starting.",
                    Created = now.AddMinutes(-60), OwnerToken = "system" },

                new ForumPost { Id = "reply-1", ThreadId = t2, Author = "Long Long Team", Category = "Show Your Build",
                    Title = "", Body = "Tip: a photo of your cable management always gets the best feedback.",
                    Created = now.AddMinutes(-45), OwnerToken = "system" },

                new ForumPost { Id = t3, ThreadId = "", Author = "Mei", Category = "Build Help",
                    Title = "Which RAM slots should I use for two sticks?",
                    Body = "I am on Step 3 with two sticks of DDR5. My motherboard has four slots - which two do I fill so I get dual channel?",
                    Created = now.AddMinutes(-30), OwnerToken = "system" },

                new ForumPost { Id = "reply-2", ThreadId = t3, Author = "Arif", Category = "Build Help",
                    Title = "", Body = "Usually slots 2 and 4 (counting from the CPU). Check your motherboard manual to be sure, since the labels A1/A2/B1/B2 differ between boards.",
                    Created = now.AddMinutes(-20), OwnerToken = "system" }
            };
        }

        // ---------- READ ----------
        public static List<ForumPost> GetThreads(string category)
        {
            lock (Sync)
            {
                var replies = Posts.Where(p => p.IsReply).ToLookup(p => p.ThreadId);

                var threads = Posts.Where(p => !p.IsReply).Select(p => p.Clone()).ToList();
                foreach (var t in threads)
                {
                    var r = replies[t.Id].ToList();
                    t.ReplyCount = r.Count;
                    t.LastActivity = r.Count > 0 ? r.Max(x => x.Created) : t.Created;
                }

                if (!string.IsNullOrEmpty(category))
                    threads = threads.Where(t => string.Equals(t.Category, category, StringComparison.OrdinalIgnoreCase)).ToList();

                return threads.OrderByDescending(t => t.LastActivity).ToList();
            }
        }

        public static ForumPost Get(string id)
        {
            if (string.IsNullOrEmpty(id)) return null;
            lock (Sync)
            {
                var p = Posts.FirstOrDefault(x => x.Id == id);
                return p == null ? null : p.Clone();
            }
        }

        public static List<ForumPost> GetReplies(string threadId)
        {
            lock (Sync)
            {
                return Posts.Where(x => x.ThreadId == threadId)
                            .OrderBy(x => x.Created)
                            .Select(x => x.Clone())
                            .ToList();
            }
        }

        public static Dictionary<string, int> CategoryCounts()
        {
            var counts = new Dictionary<string, int>(StringComparer.OrdinalIgnoreCase);
            foreach (var c in Categories) counts[c] = 0;
            foreach (var t in GetThreads(null))
            {
                int n;
                counts[t.Category] = counts.TryGetValue(t.Category, out n) ? n + 1 : 1;
            }
            return counts;
        }

        public static void GetTotals(out int threads, out int replies)
        {
            lock (Sync)
            {
                replies = Posts.Count(x => x.IsReply);
                threads = Posts.Count - replies;
            }
        }

        // ---------- CREATE ----------
        public static string AddThread(string author, string category, string title, string body, string token)
        {
            if (!Categories.Contains(category)) category = Categories[0];
            var post = new ForumPost
            {
                Id = Guid.NewGuid().ToString("N"),
                ThreadId = "",
                Author = Clip(author, 40),
                Category = category,
                Title = Clip(title, 120),
                Body = Clip(body, 3000),
                Created = DateTime.UtcNow,
                OwnerToken = token
            };
            lock (Sync) { Posts.Add(post); }
            return post.Id;
        }

        public static string AddReply(string threadId, string author, string body, string token)
        {
            var thread = Get(threadId);
            if (thread == null || thread.IsReply) return null;

            var post = new ForumPost
            {
                Id = Guid.NewGuid().ToString("N"),
                ThreadId = thread.Id,
                Author = Clip(author, 40),
                Category = thread.Category,
                Title = "",
                Body = Clip(body, 3000),
                Created = DateTime.UtcNow,
                OwnerToken = token
            };
            lock (Sync) { Posts.Add(post); }
            return post.Id;
        }

        // ---------- UPDATE ----------
        // title is ignored for replies. Returns false if the post is missing or not owned by this token.
        public static bool Update(string id, string title, string body, string token)
        {
            lock (Sync)
            {
                var p = Posts.FirstOrDefault(x => x.Id == id);
                if (p == null || !IsOwner(p.OwnerToken, token)) return false;

                if (!p.IsReply) p.Title = Clip(title, 120);
                p.Body = Clip(body, 3000);
                p.Edited = DateTime.UtcNow;
                return true;
            }
        }

        // ---------- DELETE ----------
        // Deleting a thread starter also removes all of its replies.
        public static bool Delete(string id, string token)
        {
            lock (Sync)
            {
                var p = Posts.FirstOrDefault(x => x.Id == id);
                if (p == null || !IsOwner(p.OwnerToken, token)) return false;

                if (!p.IsReply)
                    Posts.RemoveAll(x => x.ThreadId == id);
                Posts.Remove(p);
                return true;
            }
        }

        public static bool IsOwner(string postToken, string browserToken)
        {
            return !string.IsNullOrEmpty(postToken) && !string.IsNullOrEmpty(browserToken) && postToken == browserToken;
        }
    }

    // ------------------------------------------------------------------
    //  Survey (in-memory for now)
    // ------------------------------------------------------------------
    public class SurveyResponse
    {
        public string Id { get; set; }
        public DateTime Created { get; set; }
        public string Name { get; set; }
        public string Experience { get; set; }
        public int Overall { get; set; }
        public int Clarity { get; set; }
        public int Challenge { get; set; }
        public string HelpfulStep { get; set; }
        public List<string> Improve { get; set; }
        public string Comments { get; set; }
        public string Recommend { get; set; }

        public SurveyResponse() { Improve = new List<string>(); }
    }

    public static class SurveyStore
    {
        private static readonly object Sync = new object();
        private static readonly List<SurveyResponse> Responses = new List<SurveyResponse>();

        // CREATE
        public static void Add(SurveyResponse r)
        {
            r.Id = Guid.NewGuid().ToString("N");
            r.Created = DateTime.UtcNow;
            lock (Sync) { Responses.Add(r); }
        }

        // READ (summary shown on the survey page)
        public static void GetSummary(out int count, out double averageOverall)
        {
            lock (Sync)
            {
                var values = Responses.Select(x => x.Overall).Where(v => v > 0).ToList();
                count = values.Count;
                averageOverall = values.Count == 0 ? 0 : values.Average();
            }
        }
    }
}
