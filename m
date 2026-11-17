Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794892939;
	b=oMUdU0yvafnS/CwBYb+bMbuIp+DWsXzWZJ7oR/4hDP3FnLivT9+SX5QC/4ctJm/pQnmS
	 LRThgWQG+cKSf6gNzLP9ExPn9keLDiDBMuA9sEvu8ttSpX00MVYKv/dHoppDvmuRUZPba
	 1dXYgJVmgo3idLCKKZJnB0wHuzNbZkYbUCIGxc0PCh6Kno5ZumgTy1I5NZBJPQCzx1IDf
	 B3ZRJgN8FTNPX+JwMP9T4WuzVqdZ559m+qhIct96isKbO/k4KznDPWeB4G1VJZUJqgnD7
	 m+uG4w8kaZxqGqFuFnwwc+EzhiHTy+m236Z0wvce5HJQ5JVrftpdWhM7H20yNvmhScg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794892939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=KH2EdOZQFCM29AQgS9x2MTO2Oio7leMA6Gbor09I+Fo=;
	b=hzwwv82ZmjJiFnWnHvxwUVLAfDFJr2O0xmS90l4J2rXl34glNBUigNmnm+zE1TVq3U5I
	 YJR9TE8gxbG18lqZ35/SUw4OGmObKabI7UyUbzTde1GsM/0vtUM1390NEcu2UTo0mryjE
	 xBnt6yUfUWgCACml8/qblg9Or+8/NXDeEyo2y+118DATknxZKoUHSYEMu7+BLaJmdazO0
	 TnVKY73Pgeh9C6AvwR1AXH1+zAWoKgI5Gf9hNqARA1+J7yyU1nQMr3NOqbHacM2vLebuF
	 nwq2I7jQH4YzR6Pc4I5GXskuSwSFvKuTx7vJL/qbtrWA+RSgS5HTtPUAp3EE5Mek8eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QgpotozO;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5858606A329
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 05:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5858606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QgpotozO
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9995ce866so40330245ad.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794892938; x=1795497738; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KH2EdOZQFCM29AQgS9x2MTO2Oio7leMA6Gbor09I+Fo=;
        b=QgpotozOIwafP7uLbeWT2TODTeVPHollYT3PV4rkXSBXMCIZTTiFHVXcgv5LmUHUAB
         sM6H4SaB+swTJKPebfWdVgNSVhx7Ai2xMgBDufHrFUmSndxJZ4iU4RgEs8IbmCwL44H/
         RnD5BGk7CmQL0gY1bXjT8+5gHGmgOIr7KJ6wJX5KWiZOe0s7QYwEOOaJ8MXVixzFXSCa
         1VMiM5KSBUz6okr0kI9ILn/Bnje5qU8Ge1mOccIz4SKGjP/ftcIb34IS5Xkmuk+vov+n
         dgREl+PhzdtQgnIdT8DpMGklQkSQIzOcNzs6VzOfLvEJvqP16HuoeznE6BuY2LKXBF4o
         tDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794892938; x=1795497738;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KH2EdOZQFCM29AQgS9x2MTO2Oio7leMA6Gbor09I+Fo=;
        b=loiQ5D3xtvh8HPqIHnNp5TxfyRFGR9Q5ouKp5XJTkVhj46gA61CAywCyApx8QRxPpP
         dU/a3XhDnYeCldvRHjlCf7NVdOWBv8LPOfHrmWajecxFYZZ8b8MzaUtNyY6IH3nyA/hX
         HvXrN288TqgefUUmrjHmwexYaCA31kulOJgzVqedGn/4HNW3gXvvqqSdTc0+/P0+7Tao
         7qdg2oFkL3jPBaOBs7c5+M/t/7xWuQHBHtb5JOTKhptkMNr9sZYImYKdMj9XgDwsO2Q9
         NGAV8bLDUsfK1aytNgYjJtrn0AP8ATn/lN5V8pavbyr4kY/2rUG68n5nHK5coECXwqHk
         JeQg==
X-Forwarded-Encrypted: i=1; AL+hErFX040UO36CD8vkkDNrkXaD2tfXwBxyngJDlUJ3mOvPlI5QbV2A+yWGkvjxDEbePlVAAxN67y4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rFSTMTNYtdu4zTP+sksH4iiRQmwzNCHn5i+X0+Un+YveVb9qf
	As23pK7m0WPvRGlxAaFVF2OSVQw85TR/OtWHZrGaefASx3j51XTC19Jr
X-Gm-Gg: AZFdTZdjHAVDyYPsLndgaQn7qD33DZr6lIYRrXhQ288TCAtxFG4uHmjKGe0Imhiqty/
	9CAtjrtd3jaXP02AmPxWtuKS/d0VEg3XpQwjaUXyZg04LaXEfp1cyBqHZOP4luxI/ambBMhVTIv
	m6H3ZtjF+TkRc85sjDgxAMTBcWEjnAhVKfVOVR3kvgNdvZiDF4x5q23spzaExrTvqCjePzwQSHw
	HG3VT9OaBj9pKGWeIHYwkkJ6Xx4kYg8+iJ6wZwC3dd9ia/FuBXrZ7AOkyfd20245JFcfED/QJB3
	xHuSPjhklb5NJckeKzKP8G2aWDgJC5Mh8G+WWcVad1bQKE7dMNJTXtR3XuN5Vmr866DuNM2Gwzu
	WXcICkG7Z67R8k4A59sNZSa3olGzrOXYcvP+xWeuCv7JrJjmWeWaZO8wVAyxLz63NNH0rZJ8ddX
	k+WoONBZ4XKPqacW8pXp/POawDXeLo7eOZ4CJxsHWCsIkKRJjFYEqwYqH36lNAzNTJtsuxX2sE+
	SGNWdrFNyoSWz8uKYZ1JpZb6d54WrtkFV7KzQ7kBYk9+MTcHLB2u8k5s472Pgqluaww9ghl8Hm5
	/PyK9TJSDLg5HC8o2xrjQkJTwQOFeMDZ07NFNT3Z8/co86E0FoG6Aal4Il4I2M6VV63Ng0SlNj1
	LvUivebDYj4N43INNi42rBWSZG//Sqe9+pg==
X-Received: by 2002:a17:902:d4c5:b0:2ed:3ad6:141d with SMTP id d9443c01a7336-2ee0dad017bmr119363765ad.25.1794892937999;
        Mon, 16 Nov 2026 21:22:17 -0800 (PST)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a4114csm7909205ad.38.2026.11.16.21.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 21:22:17 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 05:22:16 +0000
Message-Id: <DMX8G01GB597.2KEEFI12YK9V0@gmail.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "John Fastabend"
 <john.fastabend@gmail.com>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Steven Rostedt"
 <rostedt@goodmis.org>, "Masami Hiramatsu" <mhiramat@kernel.org>, "Mathieu
 Desnoyers" <mathieu.desnoyers@efficios.com>, "KP Singh"
 <kpsingh@kernel.org>, "Matt Bobrowski" <matt@bobrowski.net>, "Shuah Khan"
 <shuah@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <netdev@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 1/9] bpf: Add log support for tracing
 link_create
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Leon Hwang" <leon.hwang@linux.dev>, <bpf@vger.kernel.org>
In-Reply-To: <20261114150610.84507-2-leon.hwang@linux.dev>
References: <20261114150610.84507-1-leon.hwang@linux.dev> <20261114150610.84507-2-leon.hwang@linux.dev>
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, Nov 14, 2026 at 07:06 AM Leon Hwang <leon.hwang@linux.dev> wrote:

tldr: pls use uapi names where possible:

> +		bpf_log(log, "tgt_prog_fd and btf_id must be both set or both unset.\n");

The uapi fields are target_fd and target_btf_id.
tgt_prog_fd and btf_id are arguments of this function.
Patches 2, 3 and 4 say target_fd for the same field.

> +			bpf_log(log, "Only allow re-attach for tracing and lsm progs.\n");

I think this one misleads. A freplace prog can re-attach.
It has to pass target_fd and target_btf_id.
The comment above the check says so.

> +			bpf_log(log, "Invalid attach_btf.\n");

attach_btf is a field of bpf_prog_aux. The user never set it.
NULL means that the prog was loaded with attach_prog_fd.
Such a prog can't re-attach at all.

> +		bpf_log(log, "Invalid kprobe_write_ctx.\n");

Another bit of bpf_prog_aux.
The rule is that both progs write to pt_regs, or none.

> +			bpf_log(log, "Invalid tracing attach_type.\n");

LSM progs get here too.

diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 35f8a71..85d97cb 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -3712,7 +3712,7 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
 	}
 
 	if (!!tgt_prog_fd != !!btf_id) {
-		bpf_log(log, "tgt_prog_fd and btf_id must be both set or both unset.\n");
+		bpf_log(log, "target_fd and target_btf_id must be both set or both unset.\n");
 		err = -EINVAL;
 		goto out_put_prog;
 	}
@@ -3725,14 +3725,14 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
 		 * attach_tracing_prog flag is set.
 		 */
 		if (prog->type != BPF_PROG_TYPE_EXT) {
-			bpf_log(log, "tgt_prog_fd is only allowed for freplace prog.\n");
+			bpf_log(log, "target_fd is only allowed for freplace prog.\n");
 			err = -EINVAL;
 			goto out_put_prog;
 		}
 
 		tgt_prog = bpf_prog_get(tgt_prog_fd);
 		if (IS_ERR(tgt_prog)) {
-			bpf_log(log, "Invalid tgt_prog_fd.\n");
+			bpf_log(log, "Invalid target_fd.\n");
 			err = PTR_ERR(tgt_prog);
 			tgt_prog = NULL;
 			goto out_put_prog;
@@ -3787,13 +3787,13 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
 		 */
 		if (prog->type != BPF_PROG_TYPE_TRACING &&
 		    prog->type != BPF_PROG_TYPE_LSM) {
-			bpf_log(log, "Only allow re-attach for tracing and lsm progs.\n");
+			bpf_log(log, "Re-attach of freplace prog needs target_fd and target_btf_id.\n");
 			err = -EINVAL;
 			goto out_unlock;
 		}
 		/* We can allow re-attach only if we have valid attach_btf. */
 		if (!prog->aux->attach_btf) {
-			bpf_log(log, "Invalid attach_btf.\n");
+			bpf_log(log, "Cannot re-attach a prog that was attached to a bpf prog.\n");
 			err = -EINVAL;
 			goto out_unlock;
 		}
@@ -3849,7 +3849,7 @@ static int bpf_tracing_prog_attach(struct bpf_prog *prog,
 	 */
 	if (prog->type == BPF_PROG_TYPE_EXT &&
 	    prog->aux->kprobe_write_ctx != tgt_prog->aux->kprobe_write_ctx) {
-		bpf_log(log, "Invalid kprobe_write_ctx.\n");
+		bpf_log(log, "Only one of freplace prog and its target writes to pt_regs.\n");
 		err = -EINVAL;
 		goto out_unlock;
 	}
@@ -5921,7 +5921,7 @@ static int link_create(union bpf_attr *attr, bpfptr_t uattr, struct bpf_common_a
 	case BPF_PROG_TYPE_LSM:
 	case BPF_PROG_TYPE_TRACING:
 		if (attr->link_create.attach_type != prog->expected_attach_type) {
-			bpf_log(log, "Invalid tracing attach_type.\n");
+			bpf_log(log, "attach_type is not expected_attach_type of the prog.\n");
 			ret = -EINVAL;
 			goto out;
 		}
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index ce11e78..ce7f530 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -23873,7 +23873,7 @@ int bpf_check_attach_target(struct bpf_verifier_log *log,
 
 		if (bpf_prog_is_dev_bound(prog->aux) &&
 		    !bpf_prog_dev_bound_match(prog, tgt_prog)) {
-			bpf_log(log, "Target program bound device mismatch");
+			bpf_log(log, "Target program bound device mismatch\n");
 			return -EINVAL;
 		}
 
@@ -24133,8 +24133,10 @@ int bpf_check_attach_target(struct bpf_verifier_log *log,
 
 		if ((prog->aux->saved_dst_prog_type || prog->aux->saved_dst_attach_type) &&
 		    (!tgt_prog || prog->aux->saved_dst_prog_type != tgt_prog->type ||
-		     prog->aux->saved_dst_attach_type != tgt_prog->expected_attach_type))
+		     prog->aux->saved_dst_attach_type != tgt_prog->expected_attach_type)) {
+			bpf_log(log, "Target differs in type from the target at load time\n");
 			return -EINVAL;
+		}
 
 		if (tgt_prog && conservative) {
 			/*
pw-bot: cr
