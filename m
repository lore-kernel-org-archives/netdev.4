Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115001;
	b=n/wdPb5XP5Q0QAz/BtXk+6bk0ONvU6TbV3vFJ5jrKMx/t29WIRjav9lF1ukA2VjyD5iB
	 RYOeu0PvhTBjfBFKGh8LjGK1hZKdN4Iwf89TwbQ3emdNllbMJ92c3p8cHnJHAs9zPfZtC
	 1bIRxPksawJFHl4jG4xWQ0TdjAcXP/2T4EbKXNqP8O2+ncw7GnfYBZSPTINnByrm5J28b
	 AWW7tzhEjLaAUuUus59hiV+fh6Vabqho5dnxKq546l7a8gwoDeIgySE2J7kFg2lRMMVmB
	 9ri38a+KkVXmL6PueU9uKEwCQf0sHSjth0NDZlLxcoExcsdPEwV+Ud8szSNIwi3r4Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bpLEycpua3oiW6PlqY9cG9z3XMx3iW2RiC0gfi/0zkY=;
	b=gFW384mdXv4ybrNgvausVgDzfQUc8V23lPV0+BSj1S5oojaZkeeeftV3VvIDmz+IQRii
	 NeBe5EkOC0n79Qs35lHWdpPTBT5RVpDfQ/ceUSU44yhDtv16FgGq32R3Qx2B/AdR7WneJ
	 yuiiENL4C/6ZhSiJ1F1sfX+m16kI/+zCgEBdPSZn7p1IwCzYZevHqNRhADu7DEnhWI94f
	 hAQRtFw6NRECvk1luN+yDqJ33Lb+QCN1tBaB08xVquvoOkmzYG7hwiAQStgwFtNdQe6C3
	 d4B7UK/NzoVsxY1WA+oruI/cFw/iFUeg+LRiAY/oaei+ctWC5WcosBtiYW4xl4SZtXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=a1xVWpuk;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416EA60A2609
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 416EA60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=a1xVWpuk
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f03eeda984so329155ad.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795115000; x=1795719800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bpLEycpua3oiW6PlqY9cG9z3XMx3iW2RiC0gfi/0zkY=;
        b=a1xVWpukVGvUbGtbxnG1+ydUx1xW+lt1/+QPN6tn0hCIPQyVzgFP8cvUOz/w262AI+
         UIQlK9+x9XjORJ7J86L/cEwWfCO/J4LjxpRPg+pbWqFM74GJdrOdjo+1owjDo1NDzW6C
         vGzPvJwzn1oui4luLl8uMoUANHDIPXFaDCakyIh5FJ5THWIA6YeTCix0SwqVnxg9W2hL
         O8kJ+TACeiX3aSJwPr4zzpJGEsvILwmSk6fiZciJoJr3UTeOsgbpkoJYxD7J8ys7RlQI
         9So1QAhTDniN27LBcXf70WsKPJcSYltvyjuCa3xkQn9cnfVzPek+FYBhkYvc4xN6y2GO
         HYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115000; x=1795719800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bpLEycpua3oiW6PlqY9cG9z3XMx3iW2RiC0gfi/0zkY=;
        b=BWHlgc9uU13wV1wo5FnNE1sEzsUtYpAifZioG4zHd8knwLACOwbo4hjHlEXZ0yUfL/
         gTqZ7QHJVfVnn1sACJHy7uyRR6WcsUgwoqb1+u5YlbgVmo+p7UVyyzERsqdcCwj0thjP
         fSDUC4MHoGbTFCAAqYjM8bbSH83srX/Grh1WAcfAhLI3iOhluZitY5wKv3u67or1/sW2
         xXh0+gJQOjKjpi4H1+Py12bsfniVxJLYax2op/dUFHbwg1ssiLWYwgf6Ig7GumXvgcD7
         ClyXX85vmUnBTmGrQlHfM3sLT2MR+3jLbom1dQiuisMtgAdMZrb7yQLsfWEVQdwUnile
         PedQ==
X-Gm-Message-State: APuU4Z8kkaFBKDCVOT/dkqG4wWnyZTSucnKfTFZxgXpq1Ph1XYb8ES/u
	qkfDCMDEwI3Eq91snbsStZK+T6xwXJUVJ166E3o2U4EZeUFavBVN8qaYPfzKH1Z8PgphbLJZCf9
	dmakguYg=
X-Gm-Gg: AZFdTZeVTfoQxStfIbvZ5eyv2EQuKJOEd1bY1gqeVe61bZZVfUP70UrGBxavW9UvwBl
	JgaBTVIhpyZc091t5qOD7wwz/eqMQ966/x3K5RtO6eFW2vQSqRh2DVe6aVvcfiCC+oxbFBoH1re
	VtFnforrl7gh1UzZZ96fZMX5AZJxDewBdzX2G4UJJttgWCdoCm/EhJGEoLNnTdlLGqxyk0RHfUg
	W5UK5Cwd9/y+UVlb7Zp6N2MVz4TiDjEPTMH1vNPEE4Kklaph50JpF2LuS3yPOtenn/DzeixNnwy
	lhCpRuuga4l/sfhlWqCtD1m4I5v+U9AI+PBTIlVMYo+lKmRSZMj2eVSaGyuSkIjOYI521Dpduez
	5sT4WmUukyS3VcMJXySemIeoUp/LojMT5f/k8fUy2TqcDG0YsZ/CR39QAQbo8iNZJaFvksHXbFY
	J3yxr7UkPINIlm9+yunmzuEU2onNoa7hD6uAklSfLNrUwqV7k57hB12y3jLn2R9/W07pHA7HpKp
	bDjoc7XeYTAwlpRqtISk0rTiSJ1zfMiXHitFOYVGPruVzYRoOW6nw7PjgJ5I08hz7e9VohnezpO
	Fs2YDBPYw/b53rfvYdlKCSHIH/9m1f/THDqo7PWLmr9n9RyQ+ZRgnYnny/OWks2bSEinQQ==
X-Received: by 2002:a17:902:d503:b0:2ef:d8a0:9e4e with SMTP id d9443c01a7336-2f03f1971ccmr8957185ad.22.1795115000491;
        Thu, 19 Nov 2026 11:03:20 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0de00asm3750225ad.35.2026.11.19.11.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:03:20 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	Hangbin Liu <haliu@redhat.com>
Subject: [PATCH iproute2-next v2 6/7] lib/bpf: check for missing bpf fs mount point
Date: Thu, 19 Nov 2026 11:02:41 -0800
Message-ID: <20261119190312.578885-7-stephen@networkplumber.org>
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

bpf_get_work_dir() returns NULL when it cannot provide a usable
work directory. It does so even after finding a valid bpffs mount,
because bpf_gen_hierarchy() fails if the tc/ subdirectory cannot be
created: running unprivileged against the default mode=700 mount,
or as root against a read-only one.

iproute2_get_root_path() passed that NULL straight to snprintf("%s"),
which glibc renders as "(null)":

  $ tc filter add dev lo parent ffff: bpf obj prog.o sec egress
  mkdir /sys/fs/bpf/tc/ failed: Permission denied
  Continuing without mounted eBPF fs. Too old kernel?
  mkdir (null)/globals failed: No such file or directory
  Unable to load program

Check for NULL and report it instead. Also check the snprintf()
return, since root_path is handed to libbpf as pin_root_path and a
silently truncated pin root is worse than a hard failure.

The "Continuing without mounted eBPF fs" warning in bpf_init_env()
goes away with it. The legacy loader could carry on without bpffs,
which is what that message described, but the only remaining caller
needs the pin root and now fails, so the warning no longer matched
what happens next. The "Too old kernel?" guess was misleading as
well: the mount is usually present and simply not writable.

Removing the warning also removes the bpf_get_work_dir() call that
primed its cache, and the per-program-type subdirectory was only
appended on the cached path. Apply it on the first call too, so a
cls program keeps pinning under tc/ instead of at the mount root.

Fixes: 6d61a2b55799 ("lib: add libbpf support")
Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
---
 lib/bpf_util.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/lib/bpf_util.c b/lib/bpf_util.c
index e58e54be..7ce8f52f 100644
--- a/lib/bpf_util.c
+++ b/lib/bpf_util.c
@@ -767,6 +767,11 @@ static const char *bpf_get_work_dir(enum bpf_prog_type type)
 	mnt = bpf_wrk_dir;
 out:
 	bpf_mnt_cached = true;
+	if (mnt && type) {
+		snprintf(bpf_tmp, sizeof(bpf_tmp), "%s%s/",
+			 mnt, bpf_prog_to_subdir(type));
+		return bpf_tmp;
+	}
 	return mnt;
 }
 
@@ -1068,20 +1073,27 @@ static void bpf_init_env(void)
 
 	/* Don't bother in case we fail! */
 	setrlimit(RLIMIT_MEMLOCK, &limit);
-
-	if (!bpf_get_work_dir(BPF_PROG_TYPE_UNSPEC))
-		fprintf(stderr, "Continuing without mounted eBPF fs. Too old kernel?\n");
 }
 
 int iproute2_get_root_path(enum bpf_prog_type type, char *root_path,
 			   size_t len)
 {
+	const char *wrk_dir;
 	int ret;
 
 	bpf_init_env();
 
-	snprintf(root_path, len, "%s/%s",
-		 bpf_get_work_dir(type), BPF_DIR_GLOBALS);
+	wrk_dir = bpf_get_work_dir(type);
+	if (!wrk_dir) {
+		fprintf(stderr, "No mounted eBPF fs to pin maps under\n");
+		return -1;
+	}
+
+	if ((size_t)snprintf(root_path, len, "%s/%s",
+			     wrk_dir, BPF_DIR_GLOBALS) >= len) {
+		fprintf(stderr, "Pin root path for %s too long\n", wrk_dir);
+		return -1;
+	}
 
 	ret = mkdir(root_path, S_IRWXU);
 	if (ret && errno != EEXIST) {
-- 
2.53.0

