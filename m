Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047350;
	b=dCj8hMI/ggfaTK2REXF7bFEucWQ79mCzWKZc6LHanoWu9iJ9EP/zIOnc6u9P8xTzOWjG
	 0+bo3fhKKNLZ9Msot0Nv1Cxz82Nxigp9LToEyJ+7a3aIzjglQyLi48rFPCyyI+sBrHASw
	 IynqQtzDDYFghX48wj/KZ07O7147o6oXs3QgeT+I/J3SeUt/n0W1H6B4oLRkQ9QhR5r8B
	 bC3vwCCm1GVzi5UdmnXAuvcZmQmCVJINWdh1rtoV0qmktWR/kD7LWpLqPtvB6jWjNeCts
	 DHfDQox+hep6G05ZVAPp2i7UKSFVQNspR6TRGV6FAynvaohckhQj8r8Pld5+bKrQFBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TI7pqw1YFEVzl5TnCMLsZoqHJ7n5u+XR+fwT3PAt6e0=;
	b=tYWMLHnCCv+F96dvF/yQ5CwLk7eaPdlYEmsOYi+YQ8lrayMSrOUmw5hTZ9akQePxfCKg
	 2TNGWgVaeT1ZYdqAbmHjrYOdS+ys2LPhWvBNqf4Xzvt2OL1jNkxC8pLz9Iy+MYNZSwWJr
	 HtzZoYPMPnlR05pq82rjVzzouHmKKZYda6fNqItVjwsEg5TGkjc4bHs1uyz6C7nyoNKDR
	 BsfrsyaicuUfSHvTvApBBZqBnvLRgIMTJoFFxV4/MUrU2cGWSpAjEnbdmQNgo9fCOMAip
	 XFUIh8B80DjTN/jc+5IOHz4dzwYce67OtE+zoclhS5y1FajausSC4jeQ6wY373vKuvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ewFn5Cgt;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B2D606A31C
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2B2D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ewFn5Cgt
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc147d86bebso276516a12.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795047349; x=1795652149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TI7pqw1YFEVzl5TnCMLsZoqHJ7n5u+XR+fwT3PAt6e0=;
        b=ewFn5CgtlfTp/BcRQcPWRck2Rp4Vsc9Y3ZJ2uA2Ma/7axINGYgokzRcsLSpzwQHQk5
         bBZWwTDmpDoRtUwNSFTF6A4DOU8BmfvBb3f1A3IS8ISinUyH4vTSoo3GIOCH35owdfR1
         WzLpfl4E9gwt8OyVthjjEpUpcVq/tmazPK/mSNJChAk8JIrbIDLlXHy92HDttrGJ5ChC
         NeGorOf2yBTbTEgMeTiLsHu5Eg3nsYtARMDMStRtJyZax1DCx5jYVFRsmA+GWnFskZ+T
         YcgM8H7MpTNlNOkW6zhODF2voyVDjWsRCqQHywoYnyF30qpSUiDij+pww8wZbjUvMfrZ
         BTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795047349; x=1795652149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TI7pqw1YFEVzl5TnCMLsZoqHJ7n5u+XR+fwT3PAt6e0=;
        b=lUodtUkQd7gD82f9EwyOTmJw6PMM6xhOW/RFoecs8QHzJpBAQPsw/q8gUOAfWHzAB/
         ac+bqmyDX6TtP0mbZc+mAoRD2bfefm1+MCUhDCJofbBbxsdIzZit+yq2Rp01ija4ZwgW
         lF5By1log26I/1Iz2mBXJS8Xo+LNH7yBoMGOVlWlTfRvS7wxylAtd9roTmfcnRmnQ0WH
         FTrBaAZg0lpaEimkszMNDIJNfY0mj2mADJZ3k2apqBgqo5SPqbHx5fsRywpfZFBdE8fR
         PdYlVhD/MXiKMrpmhLGnIzrsH0fiZe1ItGy+1cBTF+L9dvrHb98Dnu6GhdguQttFIi2b
         bKPA==
X-Gm-Message-State: APuU4Z/vYxrUiEjV0o49KRDHa8TS9cd7TDQmMIouVr3wvge2Fi8G0Pe8
	yzYXKm+iIMstgcGFbqlcmt4x733Fd9OS0hczKwFVNTFVzSaq5ILIAtxCO5139GEfuDqFuh2WbuH
	Ko3mn
X-Gm-Gg: AZFdTZcgFCpdzDocidpJGMl6DAtxq6W0KpLZhU2BfJJr6VBgZ/Vc75MQY2TrTKucfZv
	ExLmfClvVPT6Nt3VOsTd+6vZS40zfWgO/sJ7AziZon650HBzCGMOSJ0VRNANIehBZ3Aa1YEAW/0
	Q7hG/JlOLfJrLLb6sG3cVCIGcOLgkfXXLHHRWfK9Wxrf2TTESFpefZ7lKj4w1o1f2QDUaUHLu7c
	QormhLJaHYgBRkMRlwtBya338bPHClfY1N52K934XkT830LZGUzEkT7dPr6SDm4BXFBmm1tRrRt
	UJR/CEAX5H7IqxuDjehwKa8mbM9B6k7OqH9GoNqvG+IuRXaMYN2v2Ecgs03vvoDx36+PdbOcau7
	eUkIKfvtzX7LHs6YX5uLpAWCiCZunbCYUKtCZV3SBeMzvi8K4JH+vqN75DhOAa2hQeeRLXpAy8/
	0nM31qwq1KdEHn/x4HMB2Y95SGL9TNrbD0Th/SIvA/DkGZE1niEU6ufzo1wouOlewZfOYWKcxYP
	R41eY8Wl2s3Fjp6vfO8Y+JvGImosCrxgkviXEd5q509j1m7UVfUOIZ0tdUPFkHsce1Aswz1vAFK
	WD1ntuFDe3BsPjUXZ5cpCEL5Lskxs2cNe4C1NX4VSgaLKWvsxhXPiWICOBOj/0N1zoxb
X-Received: by 2002:a17:90b:1cc5:b0:3b1:6689:a016 with SMTP id 98e67ed59e1d1-3b3ffa1c69cmr136971a91.16.1795047348966;
        Wed, 18 Nov 2026 16:15:48 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3fe0b62e7sm444278a91.11.2026.11.18.16.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:15:48 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>,
	Hangbin Liu <haliu@redhat.com>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: [PATCH iproute2-next 5/5] lib/bpf: check for missing bpf fs mount point
Date: Wed, 18 Nov 2026 16:15:09 -0800
Message-ID: <20261119001539.2868072-6-stephen@networkplumber.org>
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

Fixes: 6d61a2b55799 ("lib: add libbpf support")
Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
---
 lib/bpf_util.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/lib/bpf_util.c b/lib/bpf_util.c
index e58e54be..20609339 100644
--- a/lib/bpf_util.c
+++ b/lib/bpf_util.c
@@ -1068,20 +1068,27 @@ static void bpf_init_env(void)
 
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

