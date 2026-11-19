Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114997;
	b=cdOVx9fNwWCjCBgmssceeJI2i7QMutnPLNBg99TfYEX/l52cCvwnR0vsxOoPTGjiDSyP
	 11jkPIqLEBA+6PQKVTUUbl0dQqeygZoNlRKBT2NXaP6ghdD41EdeaVNW/VUxX/0mna867
	 IC4i4g+i5N+1bx/yzRhDOxGNBPYyVSIJbeBc1KWd6jZG8t906TeWfd9bzfQWZCIUl/mU4
	 Ze59O5gEa6125nXzz5PgDPfF2l2Um0Rp2QghK0Qx3gzCHGKTqjhTIG4vJUkR6fC74zOvb
	 /9blasRotdmBgB99ha27tXAhELXJxaDpucVcO72amGZYEexCEBofegGy1shEW8OwZuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SOpz8xJcda/FwAFV+mAdjAIt7fp1KDUfQnq3ELZx+Yo=;
	b=a+X1EYawTtyZR0HWQpcGAxNC4PX+J9yUyTAsHSWsUHDqhTJv5j8jQ1c9FqiZetjoBREY
	 aOT2L8xKHEFSozyFjAUtywWEfAYDHYoi1RE0fgjoG2PKhkLpXIl4NuHGRKc6hzke3i0bk
	 mUFRfQCk5lauNHL9Naw3eAjSt/QaNqQl7TQYmWz3JoFamQkRBbL+CYdLj+UqoxtrfChEI
	 5SVnXYZqVN5LkS5P0uKmOKQwxJfn07g8AB0yrVSEKohTnad2CD1b7LYFwU5xnkMEBK55w
	 aEzxdomBFaL8JTgRdbaYTGbDfMBrLyPMKS9mbFlG1tmX8bJJb/H3wvQIbDVKDiwHiNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=F5r54Kgy;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4722B606A338
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4722B606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=F5r54Kgy
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2eff29ca765so234995ad.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795114997; x=1795719797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SOpz8xJcda/FwAFV+mAdjAIt7fp1KDUfQnq3ELZx+Yo=;
        b=F5r54KgyOzOnWQrcNuw/byQgOufsr1Pur2lWh9UdN0shmrye5CYupokRw4MCFfxU3R
         AY99ieNlqP9IvpFRBFUde+qcQ+ms9PkORvf4y/45d83A6DRy7oR870vbsImEIhx0ZYF9
         QMfe8TSPHCqDzWjf9uMtgA9pPZWEEjbwaZivTbEzSGBNyAei5x+x15OD1XwNRfvWlyK4
         R6FeURZUMU6UqCHu8Jp2ouKFA6udI2CA3Jjy7soU0Grv/ZRsm6b3J3wHrF/qji3OFuRB
         wRXMs0RCfGvJX6Hy9lTMbfnILaGYI/YDw7q/lFQK7ad6VCi6aBOK1dHu3iiEIPHD0oEJ
         qiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114997; x=1795719797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SOpz8xJcda/FwAFV+mAdjAIt7fp1KDUfQnq3ELZx+Yo=;
        b=hcUV2WVIoD8GY/C0bTuSSuL7uXDEZVgEgYn4fPlnGZIx1Pb9WY9rLQBsonm1dqThM8
         hAWqlNkdU+9T14bHOb4TEP9tQdia9rUjn0P3u5DNeCiCZUZ6+1BFrbhxNtUdQJObpc4X
         fs9ptuw4YWOucK1orotIkpvmaRK+4zE0EN3atLTLA4cJzjGrdlrB9IgfVXqkaWuE3j+n
         X+cBl3iyc9Mc5RZA8F8xzS2vDqBe89Dma8WaEoD9GIVFr3ErJdkGIYpF309OiHswe1f7
         /zvdlEFi3wRSZCM1FLhXTfqOhVzj0G0hLseTLJAcbPMy9Fdzk7SqtjBoBhr0DGh/i4BX
         cDFA==
X-Gm-Message-State: APuU4Z9r6E1E3RKQOiH9p3eDa7xoV86yYjrVYCrbgPL7xqxCSeE3flAm
	8loCTa/3CqIcnB+Y8xLst+gFWXvhL+yiSTGpIUAaHyyNJzYi7mAoJcwY4cQDLfhKZw7ol7UNf9h
	h4CW/Lho=
X-Gm-Gg: AZFdTZc42iyb+orc5WfP0AKuMKBzjwNAdqIh8+GAV2xtEJ13tzu83+qarW84SqJwLA8
	tTmb8SgwC5o3DNYwmk7vc1x33peES6WXYFGUK7gf5t5Xo6a0N9RuaQd15klTZanrqXHoge/P5xF
	Loh59UQErpXECRPZLZex0G9b35EuxZN+Li89WQMwVf/UCT0hAlVuUUdxt5Xa4L2SLwZLl+JCzEJ
	24Dzjm3xPm87wkmUBCY/G92QVASB6WU5rdXd/R+wgLEGQw1ZedqEBesa8tq0GiWX6rZ2cV6bBoI
	3udCW6SujAGNHBDMJzIeHr2KIOMtsOttb8LSJhU4HyLaB8Bf+XptRm4NjCJBg+0EtZPSJGaljVc
	JP8dMku3/S0bf8d0SlrxYCBIlD7b3unPjflA8ep0if2ScTatKRPP1gF09KbUWS9F6xavPPQus4z
	+TFxJ3I+CONU/EWdsLhXB9P2G+J0SW95pVl0lnRR+/5ig44cbw3xNJe/fboWnWddGq0aBu3pEZj
	g9CRoLXgOzBTFEvchn2he/adeE8ckmOUgEs5I7CuXk0YuXWttCa5PVEY5/kVv5umdaF2Z5PD1Dj
	zibWw+9J+VNmFiBQ9lYQulJGRrHpRKthasjOWl54PbwA2OeSYoB/q7+6tUQVpdKeK3YS
X-Received: by 2002:a17:903:22c8:b0:2e2:dd98:59e8 with SMTP id d9443c01a7336-2f03ef59ce4mr8085085ad.3.1795114996686;
        Thu, 19 Nov 2026 11:03:16 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0de00asm3750225ad.35.2026.11.19.11.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:03:16 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>
Subject: [PATCH iproute2-next v2 2/7] lib/fs: parse /proc/mounts with getmntent and check fs magic
Date: Thu, 19 Nov 2026 11:02:37 -0800
Message-ID: <20261119190312.578885-3-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119190312.578885-1-stephen@networkplumber.org>
References: <20261119190312.578885-1-stephen@networkplumber.org>
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

---
 lib/fs.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/lib/fs.c b/lib/fs.c
index a7d23498..fead9d08 100644
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

