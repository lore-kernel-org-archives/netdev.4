Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798250;
	b=gNLkChU6OBlNyGvHJ+E2cHgFBLMJXWG0lFrbcpK5rkFmOvtG1LK32ZYDEjKl1vFjwry5
	 frtG1jD0tmAiHm11hTjpxLmM53T22YEVtFSGhUdva/aFUdH2Zyd7jP1aLqVjRbfQ9EDsT
	 zSLj7Jwc2vfZv3yJd746reDnmn+1m9It0RRJSC1EonrA+KKvK1kBXyEJMSa88mgYPTLHM
	 c24KEo+Qw7Pje6Cdlqksw22B3nIzgk74X4Id6WoQELmQwaFHUB8z23KYXwqpyC54bTcBk
	 a3I4NnKG8Dgzpn57t31MQgjCdqwfqThUKuwOUaSc8TfAtc0GEDv4MeRW0iWZuwQYQ1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0KDW/w3yw9GVzuWidRzUrn3BgEn9ovNo+w0d5CV8qnA=;
	b=1vCysMrm8yqECJP6At7j4yxV6PxiN+vUE8T+iDWB4rhEBk5SoylR64D7KFalZfKp20tq
	 Dl/cTgrZb6QToJRjp4pCaUxll14zeDDw3MKeZxxnydlpmPyRLERjXui7vYSlOpSHGiVgx
	 vBUtMDPdEjlVsnUnRd0VMIGatvBLOrBHotWtC4A/QJRVGAMSEpVNTz4B0t8r7k4zVANVi
	 G0timUOH7kZ95sa13k54dIkhiB0cm2Jaq/UfClL2BcCVpRrC22xjkET4ZQBHUHY4NcH/S
	 lL2+b1LKHavhwac14tLmvUxMY1nVinwgUX4Mz6Wdj1nP3ek8ZERHrK6OHtZQ2pO4McQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=TieexNXi;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1039606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 16:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1039606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=TieexNXi
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b44bdcea8aso4781026a91.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 08:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795798249; x=1796403049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0KDW/w3yw9GVzuWidRzUrn3BgEn9ovNo+w0d5CV8qnA=;
        b=TieexNXiVerG48/CfEOh/zBdAXWCK4xhsAuQ+jFlTjQup6QTAIz8GrL3h9JBCIm7Cb
         rFwMROhBa+wYruWcWDvirMK/dlb2JHrsYaXpWk/ZNl3UVttmx55nF80S7IjPH0LE6NCo
         lDP5ZA/FHBFTHpI4K5UOPsNSst7fNeD7yAERzNnJ+sEyxHf2AZEgzqXrRktoH4DAC2yK
         iwojjVe5Sz4kUzBOCn6mCNHP7++Ou7qBr9LmbC+Cz4/evsihPaUXVba9Fr9ELZzJyH3c
         5a9EP8Wzm0ZIQxC7tICx0BKEEjDJsQEh5m2V9YrJ1qAU6VO0lP8yBcQmlaOYqRahDPx/
         r6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798249; x=1796403049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0KDW/w3yw9GVzuWidRzUrn3BgEn9ovNo+w0d5CV8qnA=;
        b=bwBdmtai/omht7d/qnxT1yV0yWMv+Ec51extAfmgURG2Vi8wBebDlm/KJu89+1uc4X
         hijWM1LlWgSGDfTErJJe3AQ1v5Z578FsgfUrSJzqCKESiJ6jhsbF3b5NhWTtgBq1A2ye
         F0Pm4npaWLv/4dOIu9zPyxOnboXFxE/X2nIC8MnDl3pdxTcBN4JTt+5d9IFBmW2J5Eqg
         UprPcYxmbdRdfZATu+QsqLVmtIbpxema0Dp+6HrXUC5g3FFaWywDmuDIFRzpS9ZZlKrn
         QTPEH+JioaDLp4ndXy5bFxSKxJgQd5TwQ+qM0abUM9aY/j4HvKdpHL25Dkyn/4slHIcb
         NbKQ==
X-Gm-Message-State: APuU4Z+enluejva6NO9SWh3bJuPzRSclZDH47flayHSRx6fY52Vvi69K
	4vjtqdK7VuFAUvThYvnDwiTlq0mFpzV77MPeHiUvjr5wj08d8He2i63ByatxXh3RMU6P/ra4ofP
	4VeyOAFs=
X-Gm-Gg: AZFdTZc+gnaTblZ0WuAXc1m0HWivu6NDp+3YldSZpieSBdkVCPo4zP/iFYFKhBf/J2W
	RXFYF1/UCKjTvQMMAut/QkpxY3PT4QxoLGrpjDXIox2OlcO8XosoZfIahEu0bxD4FVcLwCcGLTm
	UsoY3dJ4MZK58ocioHWeW//dVHdgzBX4RT5qklDP2qhrgANz4AjTZ8f8mh34pNwl4k9HJjLRrLq
	sCUN54/q+96HoYkmXFpPnsYpO+kfM2Z7/m4trG1VBK0FFygfbHCu/T/E5nWGpSTxU0b76QbYO2u
	g+vzl70pW/jL5ShGkI9gDAvODCq+svRFVbp+i7jyOC2BuedHgrx/cEh4I5LvhBpCrRunqlAMpC3
	zYe0cv0o+FfACTymnFdCr5GR3n33G51HTRhhvGZjtJmRkMZd4Macng9QXQH0j69Efqe0rCFOiuK
	FcSUclAi2Ac0ieh8atyDLXvqnV7qzBYcsyWF7MBqPWnhRChGKYF0E13+kIvGgt432uM2Kk2ph2+
	46rTdgHbvI/Y/bbXe4tK35Kb13ANK7PB52D79adVbl+CCvp/fmntwGDAKWIonPJBFvFnjsBkU0N
	sw+9sTdYV9radgWt56FxR9zITUYgrWb/JL4L68dyqDkG17HxrptGArQv2vMEzstH9fT5
X-Received: by 2002:a17:90a:e70c:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b41c7bc5a5mr17845744a91.3.1795798248886;
        Fri, 27 Nov 2026 08:50:48 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4b3c71192sm23148044a91.5.2026.11.27.08.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:50:48 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>
Subject: [PATCH iproute2-next 1/2] rt_names: parse name databases without sscanf
Date: Fri, 27 Nov 2026 08:50:45 -0800
Message-ID: <20261127165046.3656340-1-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fread_id_name() in rt_names.c and read_id_name() in names.c were the
same reader, each trying a series of sscanf formats and reporting
failure only when all of them missed. That hid several problems:

  - ids out of range were accepted after silent truncation, so
    "0x100000000 foo" bound the name to table 0;
  - ids above INT_MAX came back negative through "%d", and callers
    discarded them as a bad id, making the upper half of the 32-bit
    table id space unusable;
  - the tc class handle halves in names.c were unbounded, so
    "10000:1" shifted the major out of the id and bound the name to
    handle 1:0;
  - "%s" had no field width, safe only because the name buffer
    happened to be as large as the line buffer.

Read the whole line, strip any comment and line ending, then parse it:
strtoul() with an explicit base, a range check against UINT32_MAX, and
a bounded copy of the name token. Negative ids are skipped as before,
and text after the name is still ignored.

Put common code into get_db_entry() in lib/utils.c.
The id parsing comes from the caller, so the "major:minor" form
in tc can use same code.

The id is __u32 throughout, matching the kernel's table id width.
Trailing carriage returns are dropped, so a database saved with CRLF
line endings no longer yields names that match nothing.

Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
---
 include/names.h |  7 ++++-
 include/utils.h |  9 ++++++
 lib/names.c     | 53 +++++++---------------------------
 lib/rt_names.c  | 58 +++++++++++++-------------------------
 lib/utils.c     | 75 +++++++++++++++++++++++++++++++++++++++++++++++++
 tc/tc_util.c    | 33 ++++++++++++++++++++--
 6 files changed, 150 insertions(+), 85 deletions(-)

diff --git a/include/names.h b/include/names.h
index 2fcaacc3..7ea83681 100644
--- a/include/names.h
+++ b/include/names.h
@@ -2,6 +2,10 @@
 #ifndef DB_NAMES_H_
 #define DB_NAMES_H_ 1
 
+#include <asm/types.h>
+
+#include "utils.h"
+
 #define IDNAME_MAX 256
 
 struct db_entry {
@@ -18,7 +22,8 @@ struct db_names {
 };
 
 struct db_names *db_names_alloc(void);
-int db_names_load(struct db_names *db, const char *path);
+int db_names_load(struct db_names *db, db_id_parser_t parse_id,
+		  const char *path);
 void db_names_free(struct db_names *db);
 
 char *id_to_name(struct db_names *db, int id, char *name);
diff --git a/include/utils.h b/include/utils.h
index 87b115d9..18984d50 100644
--- a/include/utils.h
+++ b/include/utils.h
@@ -160,6 +160,15 @@ int get_rate64(__u64 *rate, const char *str);
 int get_size(unsigned int *size, const char *str);
 int get_size64(__u64 *size, const char *str);
 
+/* longest name a database may define */
+#define DB_NAME_MAX_LEN 512
+
+/* parse the id of a name database entry, returning the text after it */
+typedef char *(*db_id_parser_t)(char *str, __u32 *id);
+char *parse_db_id(char *str, __u32 *id);
+int get_db_entry(FILE *fp, db_id_parser_t parse_id, __u32 *id,
+		 char *namebuf, size_t namelen);
+
 int hex2mem(const char *buf, uint8_t *mem, int count);
 char *hexstring_n2a(const __u8 *str, int len, char *buf, int blen);
 __u8 *hexstring_a2n(const char *str, __u8 *buf, int blen, unsigned int *len);
diff --git a/lib/names.c b/lib/names.c
index 4ecae92b..6295a981 100644
--- a/lib/names.c
+++ b/lib/names.c
@@ -12,38 +12,6 @@
 #include "utils.h"
 
 #define MAX_ENTRIES  256
-#define NAME_MAX_LEN 512
-
-static int read_id_name(FILE *fp, int *id, char *name)
-{
-	char buf[NAME_MAX_LEN];
-	int min, maj;
-
-	while (fgets(buf, sizeof(buf), fp)) {
-		char *p = buf;
-
-		while (*p == ' ' || *p == '\t')
-			p++;
-
-		if (*p == '#' || *p == '\n' || *p == 0)
-			continue;
-
-		if (sscanf(p, "%x:%x %s\n", &maj, &min, name) == 3) {
-			*id = (maj << 16) | min;
-		} else if (sscanf(p, "%x:%x %s #", &maj, &min, name) == 3) {
-			*id = (maj << 16) | min;
-		} else if (sscanf(p, "0x%x %s\n", id, name) != 2 &&
-				sscanf(p, "0x%x %s #", id, name) != 2 &&
-				sscanf(p, "%d %s\n", id, name) != 2 &&
-				sscanf(p, "%d %s #", id, name) != 2) {
-			strcpy(name, p);
-			return -1;
-		}
-		return 1;
-	}
-
-	return 0;
-}
 
 struct db_names *db_names_alloc(void)
 {
@@ -63,37 +31,36 @@ struct db_names *db_names_alloc(void)
 	return db;
 }
 
-int db_names_load(struct db_names *db, const char *path)
+int db_names_load(struct db_names *db, db_id_parser_t parse_id,
+		  const char *path)
 {
 	struct db_entry *entry;
+	char namebuf[DB_NAME_MAX_LEN] = {0};
 	FILE *fp;
-	int id;
-	char namebuf[NAME_MAX_LEN] = {0};
+	__u32 id;
 	int ret = -1;
 
 	fp = fopen(path, "r");
 	if (!fp)
 		return -ENOENT;
 
-	while ((ret = read_id_name(fp, &id, &namebuf[0]))) {
+	while ((ret = get_db_entry(fp, parse_id, &id,
+				   namebuf, sizeof(namebuf)))) {
 		if (ret == -1) {
 			fprintf(stderr, "Database %s is corrupted at %s\n",
 					path, namebuf);
-			goto Exit;
+			goto exit;
 		}
 		ret = -1;
 
-		if (id < 0)
-			continue;
-
 		entry = malloc(sizeof(*entry));
 		if (!entry)
-			goto Exit;
+			goto exit;
 
 		entry->name = strdup(namebuf);
 		if (!entry->name) {
 			free(entry);
-			goto Exit;
+			goto exit;
 		}
 
 		entry->id   = id;
@@ -102,7 +69,7 @@ int db_names_load(struct db_names *db, const char *path)
 	}
 	ret = 0;
 
-Exit:
+exit:
 	fclose(fp);
 	return ret;
 }
diff --git a/lib/rt_names.c b/lib/rt_names.c
index 3dba9642..8a992d38 100644
--- a/lib/rt_names.c
+++ b/lib/rt_names.c
@@ -23,55 +23,29 @@
 #include "rt_names.h"
 #include "utils.h"
 
-#define NAME_MAX_LEN 512
-
 int numeric;
 
 struct rtnl_hash_entry {
 	struct rtnl_hash_entry	*next;
 	const char		*name;
-	unsigned int		id;
+	__u32			id;
 };
 
-static int fread_id_name(FILE *fp, int *id, char *namebuf)
-{
-	char buf[NAME_MAX_LEN];
-
-	while (fgets(buf, sizeof(buf), fp)) {
-		char *p = buf;
-
-		while (*p == ' ' || *p == '\t')
-			p++;
-
-		if (*p == '#' || *p == '\n' || *p == 0)
-			continue;
-
-		if (sscanf(p, "0x%x %s\n", id, namebuf) != 2 &&
-				sscanf(p, "0x%x %s #", id, namebuf) != 2 &&
-				sscanf(p, "%d %s\n", id, namebuf) != 2 &&
-				sscanf(p, "%d %s #", id, namebuf) != 2) {
-			strcpy(namebuf, p);
-			return -1;
-		}
-		return 1;
-	}
-	return 0;
-}
-
 static int
 rtnl_hash_initialize(const char *file, struct rtnl_hash_entry **hash, int size)
 {
 	struct rtnl_hash_entry *entry;
+	char namebuf[DB_NAME_MAX_LEN] = {0};
 	FILE *fp;
-	int id;
-	char namebuf[NAME_MAX_LEN] = {0};
+	__u32 id;
 	int ret;
 
 	fp = fopen(file, "r");
 	if (!fp)
 		return -errno;
 
-	while ((ret = fread_id_name(fp, &id, &namebuf[0]))) {
+	while ((ret = get_db_entry(fp, parse_db_id, &id,
+				   namebuf, sizeof(namebuf)))) {
 		if (ret == -1) {
 			fprintf(stderr, "Database %s is corrupted at %s\n",
 					file, namebuf);
@@ -79,9 +53,6 @@ rtnl_hash_initialize(const char *file, struct rtnl_hash_entry **hash, int size)
 			return -EINVAL;
 		}
 
-		if (id < 0)
-			continue;
-
 		entry = malloc(sizeof(*entry));
 		if (entry == NULL) {
 			fprintf(stderr, "malloc error: for entry\n");
@@ -89,6 +60,11 @@ rtnl_hash_initialize(const char *file, struct rtnl_hash_entry **hash, int size)
 		}
 		entry->id   = id;
 		entry->name = strdup(namebuf);
+		if (!entry->name) {
+			fprintf(stderr, "strdup error: for name\n");
+			free(entry);
+			break;
+		}
 		entry->next = hash[id & (size - 1)];
 		hash[id & (size - 1)] = entry;
 	}
@@ -100,25 +76,31 @@ rtnl_hash_initialize(const char *file, struct rtnl_hash_entry **hash, int size)
 static int rtnl_tab_initialize(const char *file, char **tab, int size)
 {
 	FILE *fp;
-	int id;
-	char namebuf[NAME_MAX_LEN] = {0};
+	char namebuf[DB_NAME_MAX_LEN] = {0};
+	__u32 id;
 	int ret;
 
 	fp = fopen(file, "r");
 	if (!fp)
 		return -errno;
 
-	while ((ret = fread_id_name(fp, &id, &namebuf[0]))) {
+	while ((ret = get_db_entry(fp, parse_db_id, &id,
+				   namebuf, sizeof(namebuf)))) {
 		if (ret == -1) {
 			fprintf(stderr, "Database %s is corrupted at %s\n",
 					file, namebuf);
 			fclose(fp);
 			return -EINVAL;
 		}
-		if (id < 0 || id > size)
+		if (id >= (__u32)size)
 			continue;
 
 		tab[id] = strdup(namebuf);
+		if (!tab[id]) {
+			fprintf(stderr, "strdup error: for name\n");
+			fclose(fp);
+			return -ENOMEM;
+		}
 	}
 	fclose(fp);
 
diff --git a/lib/utils.c b/lib/utils.c
index f4bd53ff..9accea02 100644
--- a/lib/utils.c
+++ b/lib/utils.c
@@ -1260,6 +1260,81 @@ __u8 *hexstring_a2n(const char *str, __u8 *buf, int blen, unsigned int *len)
 	return buf;
 }
 
+/*
+ * Parse the id of a name database entry.  A leading 0x selects hex,
+ * otherwise the id is decimal, so a leading zero is not octal.
+ * Returns the text following the id, or NULL if it is not a valid id.
+ */
+char *parse_db_id(char *str, __u32 *id)
+{
+	unsigned long val;
+	char *end;
+
+	errno = 0;
+	val = strtoul(str, &end, strncasecmp(str, "0x", 2) ? 10 : 16);
+	if (end == str || errno == ERANGE || val > UINT32_MAX)
+		return NULL;
+
+	*id = val;
+	return end;
+}
+
+/*
+ * Read one "id name" pair from a name database, using parse_id for the
+ * spelling of the id.
+ * Returns 1 on success, 0 at end of file and -1 on a malformed line,
+ * in which case namebuf holds the offending text for the error message.
+ */
+int get_db_entry(FILE *fp, db_id_parser_t parse_id, __u32 *id,
+		 char *namebuf, size_t namelen)
+{
+	char line[LINE_MAX];
+
+	while (fgets(line, sizeof(line), fp) != NULL) {
+		char *p = line, *end, *name;
+		__u32 val;
+		size_t len;
+
+		/* drop any comment and the line ending, CRLF included */
+		p[strcspn(p, "#\r\n")] = 0;
+
+		while (*p == ' ' || *p == '\t')
+			p++;
+
+		if (*p == 0)
+			continue;
+
+		/* ids are unsigned; a negative one is simply not ours */
+		if (*p == '-')
+			continue;
+
+		end = parse_id(p, &val);
+		if (!end)
+			goto corrupt;
+
+		/* the id must be followed by whitespace, then the name */
+		if (*end != ' ' && *end != '\t')
+			goto corrupt;
+
+		name = end;
+		while (*name == ' ' || *name == '\t')
+			name++;
+
+		/* anything after the name is ignored */
+		len = strcspn(name, " \t");
+		if (len == 0 || len >= namelen)
+			goto corrupt;
+
+		strlcpy(namebuf, name, len + 1);
+		*id = val;
+		return 1;
+corrupt:
+		strlcpy(namebuf, p, namelen);
+		return -1;
+	}
+	return 0;
+}
+
 int hex2mem(const char *buf, uint8_t *mem, int count)
 {
 	int i, j;
diff --git a/tc/tc_util.c b/tc/tc_util.c
index 45d76e75..2b0b988d 100644
--- a/tc/tc_util.c
+++ b/tc/tc_util.c
@@ -28,6 +28,33 @@
 
 static struct db_names *cls_names;
 
+/*
+ * A tc class handle is spelled "major:minor", both in hex, as tc prints
+ * it.  Plain ids are still accepted.
+ */
+static char *parse_cls_id(char *str, __u32 *id)
+{
+	unsigned long maj, min;
+	char *end, *p;
+
+	if (!strchr(str, ':'))
+		return parse_db_id(str, id);
+
+	errno = 0;
+	maj = strtoul(str, &end, 16);
+	if (end == str || *end != ':' || errno == ERANGE || maj > 0xffff)
+		return NULL;
+
+	p = end + 1;
+	errno = 0;
+	min = strtoul(p, &end, 16);
+	if (end == p || errno == ERANGE || min > 0xffff)
+		return NULL;
+
+	*id = maj << 16 | min;
+	return end;
+}
+
 #define NAMES_DB_USR CONF_USR_DIR "/tc_cls"
 #define NAMES_DB_ETC CONF_ETC_DIR "/tc_cls"
 
@@ -40,16 +67,16 @@ int cls_names_init(char *path)
 		return -1;
 
 	if (path) {
-		ret = db_names_load(cls_names, path);
+		ret = db_names_load(cls_names, parse_cls_id, path);
 		if (ret == -ENOENT) {
 			fprintf(stderr, "Can't open class names file: %s\n", path);
 			return -1;
 		}
 	}
 
-	ret = db_names_load(cls_names, NAMES_DB_ETC);
+	ret = db_names_load(cls_names, parse_cls_id, NAMES_DB_ETC);
 	if (ret == -ENOENT)
-		ret = db_names_load(cls_names, NAMES_DB_USR);
+		ret = db_names_load(cls_names, parse_cls_id, NAMES_DB_USR);
 
 	if (ret) {
 		db_names_free(cls_names);
-- 
2.53.0

