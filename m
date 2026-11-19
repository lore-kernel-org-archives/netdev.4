Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047346;
	b=DfGqo2vHIXxWd06P3V83faorRnQ2Rx3IlFmepWJ4n8vZstBiIBaqs6PylbT41aEF2+1D
	 K4dDzk12Sk+3fORbnazqI6cl+RN0feEJDklNTxupPD6XluwsOWHqeK35S4VnT+evqX7x1
	 GvtoAQfEHNlQOgNn84Z4iKHIBgclLXc7jrfN3r1BwlU46yMgKrApZv/axpo+dxle/6Auv
	 ++3iG7wD9kvTKZYhxCddzHlJFhv4NfreAlE3J155bLHroYWL2EIgmwywHpvkmizOsBMOE
	 JaPXxo+Onv7BMkCWIMn1lwrqxiLtaPKND50AmHea6g+hrdMyAjUSl1dWq/tqZuUa0qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C2fXEG27T4dld9p4UtgTSWNCz3lamFiC6w8zSptd1es=;
	b=JO3vPU6OFzqjiAhugWyGx1CFkg4HAgRM4ngP2rGy2vqAM0gajZotTUZt3gZMwLJXRWmY
	 UhnBKEXc1j0ARQ3oCkGU/n/aDqTSujvbrTE84Dl4VBm34qiGHPTb2fJXYyFBE6CKbQJLc
	 DGIyK7YzRh3VMIhKzmhvsQpUQg2GacyDb3XGSkYEca1c7/8K5bShxcCCfFCOVM8tzE/w0
	 fPuEToWh0a1YR6j/NZS9eeOdGL33+XDMDf/lNm0JimfDWgFPoIp3LM5wbxliF0QGIVNkY
	 HZO+M2RLzi2AjeOibEXFLW29Js3fgNIE0c8njLNnBcNLZlc88pg/nV2gUZWbYGeSWoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=afQ4Ifoq;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E73606A33B
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7E73606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=afQ4Ifoq
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b3af93b85cso907427a91.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795047345; x=1795652145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C2fXEG27T4dld9p4UtgTSWNCz3lamFiC6w8zSptd1es=;
        b=afQ4IfoqVEXSXrxr6OGyfe7ytSAtrWAdHwLS4A0RudNWywY4kGFboZcB5r62NPaTgb
         5ALDbLXJUDzn+H2DYTSmVTRXUN6jO+3Af7yBldlexAtXxthjjpizFtS3VQCUQeH+xvui
         tx6MOYVjVMGxloAPqfWwLh0SmiXjoDgnTp9ZhUvjatx1aAmHXxfULPYlav25OKR2otqu
         1BXeZWzMPQGWxld8IBPg7cFtHvjMNGfJje0PbGMgxVTfxs8UB1N7rCN+vmnvtStxvNvx
         obRWsjQt++sQJJchqY7CODQyBKKgR2HphSLFiTNTZrfs2Q3A1uKopqGRZC/0Haj0/CZL
         sMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795047345; x=1795652145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C2fXEG27T4dld9p4UtgTSWNCz3lamFiC6w8zSptd1es=;
        b=Vsy94WHVwiavoeAnqJuEb2qcqQb1+2OG3j1rH9LTEbQL1v9jB6hXQav9vEsNGTpW/K
         yEgKMhjlENhXYyAxnHvcZezqkD1CLW5WW3D7PoTRpvpNYiZt87jijSyhThRY+hU24tbm
         Fuj6E0axiBdq0E0gL0uGl/udVJouqPe6q62xFxzGtRRE7w8F2UvOcCZ2p2/ygBTnrqpt
         MIG8KC1HC9etbGoz05hnpFNW3/P9aGCmXy3Jr4C0zbIQw7kFiHv2MpVdwwN1A8769Zd3
         kYSDrhH/3S5/W4B4RxN6lRe3+iHE3APPTQcGG3p2EmFVl+aZMN4SAAb5DkfAmP/yItnF
         MRGg==
X-Gm-Message-State: APuU4Z/u9bmJXj5iMItC8m6YOKeqg605cSOwJtsSsLNWwThzwoe4bcVk
	7TySHLrtsz0kpbWNsvUT3YwbmlNXb2h/mQ4Lan/y8IXfNeQ2v2+srwnMI1estMQHWdy7UWlNnVZ
	zxkj31DQ=
X-Gm-Gg: AZFdTZc70As9gd2QMyyoFCktyUg9+kshDg/9sRIS77SNDSEa1wj71MjHErw6I+mRWQT
	sUUCVJdg6cXFUYEy9GERYpfVcGOAeTzgCeK9suNc35Y+bDPpiplnjMSE/s76faxauGumggCcJHn
	t3p/++9xLTZWWh6hUHlanmrbwHMtIoNdvzDDAAb+3Kz3HWCTjfofcynup9f1KEbU3Vsb58hSINH
	0CjPWUVtnUkvvrGq9YchZR10Hg+E54Gt08kxfOKpum4Ob56lfsRK8sPx7Xluiyv3SbR84Oace0k
	hr0RGxSAGf11Qt1I6EXZ5mkR6UzyOAm66P9zXQ+S+pVs6zs2xxT+fqtGg0bPKmCeXod1u/6SYoL
	h3OUDOkqPenPBxnwO5fSmvEpWGb22dFr/FRaaSqF1IGQvyx0mkmd09I16FGi5ADmAcckR33jdk9
	+res2sJCMkNHFyd7cgI3408EEcJLpZ5v5z2U/9S6BTQA5ESyIHIWt3RSKDaJuY36PuMHKFlBJLL
	+eGRqtir1VFoUMk8xrhMRbhTLaO2kr9O/NNfccko6XWuL5uSq+OMthThI0zmuiFs/1qt8BW5CP+
	nGJNARI9PQqHZlGUXK0yq9Z+wJIkiFtb/i8OcIMq1cJ7VcJ91K45G0qKYJQq3eOFfkLd
X-Received: by 2002:a17:90b:4b86:b0:3a7:db88:3491 with SMTP id 98e67ed59e1d1-3b3d0761797mr4218712a91.33.1795047345017;
        Wed, 18 Nov 2026 16:15:45 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3fe0b62e7sm444278a91.11.2026.11.18.16.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:15:44 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>
Subject: [PATCH iproute2-next 2/5] lib/fs: parse /proc/mounts with getmntent and check fs magic
Date: Wed, 18 Nov 2026 16:15:06 -0800
Message-ID: <20261119001539.2868072-3-stephen@networkplumber.org>
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

find_fs_mount() has the same fscanf("%s") parsing problem as
bpf_find_mntpt(). A forged /proc/mounts line can make the cgroup2
mount point resolve to a directory owned by an unprivileged user,
and ip vrf exec then creates directories there as root.

Use getmntent() and only accept a mount point if statfs() reports
CGROUP2_SUPER_MAGIC.

Fixes: 1dafceb1c9c6 ("Add filesystem APIs to lib")
Reported-by: Anthropic OSS scanner (ANT-2026-SJ93QIGZ)
Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
---
 lib/fs.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/lib/fs.c b/lib/fs.c
index 6fe1d6db..bd94b18b 100644
--- a/lib/fs.c
+++ b/lib/fs.c
@@ -9,6 +9,8 @@
 #include <sys/stat.h>
 #include <sys/socket.h>
 #include <sys/mount.h>
+#include <sys/vfs.h>
+#include <mntent.h>
 #include <ctype.h>
 #include <fcntl.h>
 #include <stdio.h>
@@ -17,6 +19,7 @@
 #include <string.h>
 #include <errno.h>
 #include <limits.h>
+#include <linux/magic.h>
 
 #include "utils.h"
 
@@ -50,30 +53,34 @@ static int open_by_handle_at(int mount_fd, struct file_handle *handle, int flags
 }
 #endif
 
-/* return mount path of first occurrence of given fstype */
-static char *find_fs_mount(const char *fs_to_find)
+/* return mount path of first mount of given fstype that passes statfs check */
+static char *find_fs_mount(const char *fs_to_find, unsigned long magic)
 {
-	char path[4096];
-	char fstype[128];    /* max length of any filesystem name */
+	struct mntent *ent;
+	struct statfs st;
 	char *mnt = NULL;
 	FILE *fp;
 
-	fp = fopen("/proc/mounts", "r");
+	fp = setmntent("/proc/mounts", "r");
 	if (!fp) {
 		fprintf(stderr,
 			"Failed to open mounts file: %s\n", strerror(errno));
 		return NULL;
 	}
 
-	while (fscanf(fp, "%*s %4095s %127s %*s %*d %*d\n",
-		      path, fstype) == 2) {
-		if (strcmp(fstype, fs_to_find) == 0) {
-			mnt = strdup(path);
-			break;
-		}
+	while ((ent = getmntent(fp)) != NULL) {
+		if (strcmp(ent->mnt_type, fs_to_find) != 0)
+			continue;
+
+		if (statfs(ent->mnt_dir, &st) < 0 ||
+		    (unsigned long)st.f_type != magic)
+			continue;
+
+		mnt = strdup(ent->mnt_dir);
+		break;
 	}
 
-	fclose(fp);
+	endmntent(fp);
 
 	return mnt;
 }
@@ -81,7 +88,7 @@ static char *find_fs_mount(const char *fs_to_find)
 /* caller needs to free string returned */
 char *find_cgroup2_mount(bool do_mount)
 {
-	char *mnt = find_fs_mount(CGROUP2_FS_NAME);
+	char *mnt = find_fs_mount(CGROUP2_FS_NAME, CGROUP2_SUPER_MAGIC);
 
 	if (mnt)
 		return mnt;
-- 
2.53.0

