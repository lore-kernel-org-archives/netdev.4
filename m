Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047344;
	b=SpjcqsslBRvPvnBjDNGXVAAJhDu9RQ9JtLZEXRPbA9VjdHckySIZoDh3biADJyozSFbh
	 HhLB7NlwoH1LTDyq36DMtLBRcfqZzx0EGAotQ5ep9p73XBtMaMKRxEdiwLJnCGlfAxhf7
	 MlxICCre0EH79bXXVrIhve8Dvw8Mwr4rb0EcOfw4Lnrv+ca0QC0+PByfOcwDZots+jVVD
	 7uSuC6OXI0mViHfOTpEQNAe3swJESTOckTk6ULDNw6wQugWzCtzY1JFKQLB3agu5ORjyC
	 TQkHBh5bCm4FG3HvNSZSAQqydStL+SaTOTuI5IoPG323xZuQiwrnFNSH4n7vP5MKUjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2VHt6DRJXo286lDMz7Vj0ZDEKtUATaLidk8Vb4Ed+zU=;
	b=a1EYetjrULn3ODUV6oqcFe+/tqhB+pn5xw31Qhrn3NNtPYokrxJvdoOvIkt01YgAzrov
	 JbS4hAc0MCOSZMMZ30ZoElUNyhjD2+5G+fLCbwVeoFznpc8COsecfZfU6euwRtVlk9WBR
	 jzeo6y4ZjDRsgzMb2Q2Z5+R02hAskRyuJZd4vt+iKdSNvcRjJhugByL3l5BzGf6XlJPF8
	 0uwdfmnfiHYd0yXFn0BDdgmUl4icMCcx8vrIAuPxfkKvil9+b2oPoLJAcuCZ53PoR7fWm
	 GIq3eVNkflS930USq+7X9ih51wuw+7FlTEQkB0snzG+klJZE2zjPk0UD1WsG9NBvHLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hJKBO5ex;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78754606A32C
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78754606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hJKBO5ex
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b37951a397so1365956a91.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795047344; x=1795652144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2VHt6DRJXo286lDMz7Vj0ZDEKtUATaLidk8Vb4Ed+zU=;
        b=hJKBO5exFiHj88Tk/7ZSj1bcMAZkNxtbBVrMAgq97GSACwdyjCO0vA1f54USyY/Bej
         j7gI62b6vuVOkUgLf0E9NVoXPjMQ2CWBbIxBduYpBmktrK37zjVvGigwP8nzxf4rDxyd
         GUR9HsjBvJzsSKYYvWzCFPoUIf0ufQZ4J21+V78abzaiy0n7j0cY0r5EeSmTDr18Yq/k
         wrSsPkQa/2kkuuCMivB9ATCgKP2lZf+k+ORQbzf2moy6faueocN9nUaWuEJ+g4USeHm5
         6pKQwwKPhXpjQBCzhsR1jLXBgHE4C0zB2mSLmKUV1rXGTvTrsK4wvALN59EVmB1xC62B
         grJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795047344; x=1795652144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2VHt6DRJXo286lDMz7Vj0ZDEKtUATaLidk8Vb4Ed+zU=;
        b=Ly+8rEAJtxOzpYyMmRCFwUKsumXE4bSWoJgnpL4r0vuczw2v/wdXE0coLamKxUFNpn
         Cbe/nDMypWD8YJ0VXpAifnlwdm1R7fxFFbE0GCMhSXIcw4YERJ18zc5FuO7zzrN3FMd3
         GNUu/t/1Tfnye7X6oSFq4RZNyi/urUkvUzIdzRTgqgskcByB+ToWR4bnmp7RTE+7sXK5
         1t1Em6qwdloRpOcjOm7GZOMHBxHqVstiUr60Q6fowODHvz4G5RsAEHtTsQYJR7fe9fqU
         8uamghg6C9Ocv/A2nZPL1SLcxtxc4OPeIDZROSfCoddvMMVTjd/n3GrDcnT4LRdYXrvQ
         KsFQ==
X-Gm-Message-State: APuU4Z9vQeY0PiCD7Q0K1AJSjXUWeX0fK9U9xWYH1b2mY/yd/CWipzQL
	db8AWYrlDQLPnP+LDZnyx9w9gnCTvCykdmhXtI5SyG03ndgzO/9BC7ygaM5LIteLHNTzGmXpr9R
	AY1Bke9M=
X-Gm-Gg: AZFdTZdJlrgKQ2ZkfVbUEfUCqvpyz2ZWKcDfn19TTuh0IuEMEdmZ2DXaCMrv7Z1U3FY
	o3yFeeKPTICNprq7UiXsk8cZXXzs1wSRlNRjcZsCuL0cbR/icMlzp+bd514KhcbEk7cQcBeG5ZW
	brrFLQxJ/3jZaUa7SHlq/wV6hAWjckwdkYIYg8o1ZoAP1F397SGsvXKIwgEUgP9FJEVvY5B67yn
	jE9CJWKlRjfm8LlSaMB0l8QupjF8ASOCJBK+C10Ey47gDvtuijmPr33TLLE9Rjtx+eA7TQWcKcB
	7S0yKSQ+Wbi7+XZhMCaWDy7aZ3hbo8t9UXfEYrGzUVzQVC7T7NcU7LydIo7Kb5EObvBb/GYpwhe
	TxyTS2gioYhlptaP2QyFrufkIKuobW9jEbS1w/bxXc5ix/mt2AADh9bflseGZXY6VzK0fyOUWs5
	u91JUZqPnEBS8EwxebZq05tnFWeH6bl/iuwzQygK+Y5fc3q/ZB07dZs4Sv1hIIT7ffU/CA/DC0u
	+a8RpXduRTiqL7gAGAnkyqU59BaK39sZlEzvs0CDRc2VUhU4FUfEd1CkjW70tP0jnf+YHp8N3FE
	iqeyuQzmR22zeFH7nXFhN0ybRaXfZ7IubimfyQYQe1oAosscuL2FOVvb+3trAwh6+IVr
X-Received: by 2002:a17:90b:4410:b0:3b1:12ba:867e with SMTP id 98e67ed59e1d1-3b3d07a26dcmr4572633a91.13.1795047343829;
        Wed, 18 Nov 2026 16:15:43 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3fe0b62e7sm444278a91.11.2026.11.18.16.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:15:43 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [PATCH iproute2-next 1/5] lib/bpf: parse /proc/mounts with getmntent and check fs magic
Date: Wed, 18 Nov 2026 16:15:05 -0800
Message-ID: <20261119001539.2868072-2-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119001539.2868072-1-stephen@networkplumber.org>
References: <20261119001539.2868072-1-stephen@networkplumber.org>
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

bpf_find_mntpt() parsed /proc/mounts with fscanf("%s"). The kernel
does not escape \r, \v or \f in mount paths, so a mount path
containing them can be misparsed as a bpf mount at some other path.
That path was used without the statfs() check done for the well
known mount points, and tc/ip then created the tc/globals hierarchy
and symlinks there.

The scan is done whenever /sys/fs/bpf is not bpffs, which is always
the case under ip -n, tc -n and ip netns exec.

Also, the %4096s conversion into a PATH_MAX buffer could write the
terminating NUL one byte past the end.

Use getmntent() and apply the statfs() magic check to every
candidate. Reject paths that are too long rather than truncate them.

Fixes: 32e93fb7f66d ("{f,m}_bpf: allow for sharing maps")
Reported-by: Anthropic OSS scanner (ANT-2026-SJ93QIGZ)
Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
---
 lib/bpf_legacy.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/lib/bpf_legacy.c b/lib/bpf_legacy.c
index 9d5fcf5f..5b8ac47d 100644
--- a/lib/bpf_legacy.c
+++ b/lib/bpf_legacy.c
@@ -32,6 +32,7 @@
 #include <sys/mman.h>
 #include <sys/mount.h>
 #include <sys/resource.h>
+#include <mntent.h>
 
 #include <arpa/inet.h>
 
@@ -543,12 +544,13 @@ static const char *bpf_find_mntpt_single(unsigned long magic, char *mnt,
 	int ret;
 
 	ret = bpf_valid_mntpt(mntpt, magic);
-	if (!ret) {
-		strlcpy(mnt, mntpt, len);
-		return mnt;
-	}
+	if (ret)
+		return NULL;
 
-	return NULL;
+	if (strlcpy(mnt, mntpt, len) >= (size_t)len)
+		return NULL;
+
+	return mnt;
 }
 
 static const char *bpf_find_mntpt(const char *fstype, unsigned long magic,
@@ -556,7 +558,8 @@ static const char *bpf_find_mntpt(const char *fstype, unsigned long magic,
 				  const char * const *known_mnts)
 {
 	const char * const *ptr;
-	char type[100];
+	const char *found = NULL;
+	struct mntent *ent;
 	FILE *fp;
 
 	if (known_mnts) {
@@ -568,24 +571,21 @@ static const char *bpf_find_mntpt(const char *fstype, unsigned long magic,
 		}
 	}
 
-	if (len != PATH_MAX)
-		return NULL;
-
-	fp = fopen("/proc/mounts", "r");
+	fp = setmntent("/proc/mounts", "r");
 	if (fp == NULL)
 		return NULL;
 
-	while (fscanf(fp, "%*s %" textify(PATH_MAX) "s %99s %*s %*d %*d\n",
-		      mnt, type) == 2) {
-		if (strcmp(type, fstype) == 0)
+	while ((ent = getmntent(fp)) != NULL) {
+		if (strcmp(ent->mnt_type, fstype) != 0)
+			continue;
+
+		found = bpf_find_mntpt_single(magic, mnt, len, ent->mnt_dir);
+		if (found)
 			break;
 	}
 
-	fclose(fp);
-	if (strcmp(type, fstype) != 0)
-		return NULL;
-
-	return mnt;
+	endmntent(fp);
+	return found;
 }
 
 int bpf_trace_pipe(void)
-- 
2.53.0

