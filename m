Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794683216;
	b=C7KvlzsrfQ8phYl+bNfvRMdudOg1R53PCuWqdkw3TT7m0WS1tfLxz3pwSq+hnw52Jb02
	 FLWqXftsUam/6EhLA49gi1dlodvDoyuod7lLooXnMBMKl/1epX6S+/GZMu1IUyTijJp3F
	 D333rSGhI8+o8ftkG9x4Eb0secyCG2B9wGBe3Nl+qQn0i3oZXqhcrAYjynT+cVZ+cquGk
	 hXtbP3v9DMrP7rwXiJWy6zFNTLs2cfnPsv5BWQGVaDtNeyzUVT0ea7P3jVIONVq1AsgfR
	 JKVsLfIPVUL1s2pcfgQ1Te5IKe9BQucXx+1I5E6MIQ5raSA2jSqbsiO1GzwQ9Ibhc7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794683216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=GXnJ7EqkeurbEfzLsmAnsY6oVJKbWZqTiWPnVwATPj8=;
	b=3HIbuk+5+3GQ0qp7kFHJTlPhkXXDf3GgcF7na8TwYTD/HqVniMM4AY5TFphgYzuV8RW/
	 sewSOGIOD9zHDjUukHjsiMANDA0mRQArDQEN+PVOJKJTTr+rzRxOe+0R2Dvj6FH3GGub6
	 NC+RO4nGUevwRnqbBeYpA5Y4N4DuBabTkXi865SPomHGi/25Mspr0KDQNnI3A4n9j4Yk7
	 T7KbuO9T9KUvEqpEOXeUk1tCgTNPwpoxKGRQ54/pyH0yaEgwRtKyte1DG1NJIXAgudSbu
	 c/kv79WPOo4XL6EKvBK3hK24975kCV+f44dIkjpSDHt2rIQ1JqBFLWnr1g3fgFfp3QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V4GVwOrm;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461BD606A327
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 19:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 461BD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V4GVwOrm
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso1044232a91.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 11:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794683214; x=1795288014; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GXnJ7EqkeurbEfzLsmAnsY6oVJKbWZqTiWPnVwATPj8=;
        b=V4GVwOrms2+fzVnpV/iw5bpRwU+scd7Yf5pD18/YFy2oTqf0gWxkJLNHhadzJtY/PT
         9Osxm1tNSJi5+jkFgDR8U6u2WJwNbJrDf+XC0SEbVlDHiO5boZ433BAZzu7Eu9T38Msp
         2FvzhN/BgIxldcL0VeXXcrtsmheCfV8EsBrB0O18aHJu6RwZ5vDo/FbJ4bNZah/IyIwl
         yht61N3RvnINOf4WD3vmFZoAKOXPvEi1luSqfcD2HyZJMkOFm+Lxx14l5X01GkEuFkcg
         CSM5sAJpl9D3r5kZzG6j8L7vCRyH438S6ZxEGx1f9YEy235H/akRh2aMTHFJnO24vmmO
         tMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794683214; x=1795288014;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GXnJ7EqkeurbEfzLsmAnsY6oVJKbWZqTiWPnVwATPj8=;
        b=m3jGGwhH1gDnHGB+2EiDRzOzikIHae4cRYurMeDKlUM8VE6Lp4ny98xOev2/fpevsh
         vHgPl8+gWUISu/n/cpLx4mJLrHZ+DD+Gg7m3Df+QmH/LemzDXmhA4QBURq0/7KjU5nvz
         DP5kanKZFaZhy5JEv9knAZpkDvjEt8wwCStMgAxEYkh1QYdXCsyBSurhy1YqfFlE3MuW
         TwtJJiTk1OzW11R+qxNvGLoQbtAnmAuKx8SecujYBOTXfqiuLgfh6b4qNmZiIMvwvbGY
         +UQ6r5XOdVM26FeaqtTjwNwrYRBKw64mmv1qFH+gBLjpu0V2ns8y+GFAWzbXaRh7nbHT
         Xrtg==
X-Forwarded-Encrypted: i=1; AL+hErFXie7Vfros8/hN2IjNmKIHSwcwtaf1JKvxbU62nO4rTGcxZq21b1eFfnmMlYrnI14iw5/AhWM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uAMGmKsEIaxRbavfLuQJYDdq1N3TTroMswHheuBjlMNUFi7Eh
	oja23TZz8q65UWtr1G7fJqjH/+yy94SHVVemZHo4li4DCSPIBB5E12j6
X-Gm-Gg: AYBFou0HqIG9bk34Z1PwO9lPCiFkXbUKpVkl8MiNp4rIAegK1J/CC8LUEvtREKVPI8n
	R71o/oGVdeP9GfY4i4Y70gA+C9viSXWzjU5HGR8wq5K7n/4GpIyvWEJawwlvtAnnf0cj/dN6EcD
	uS9i37XtRutWy/bSP7GMqIogcnb2/IC/w+gUcjA8eeH+Xmwy5Vypaq5Q7kWFDyFv8ZjTSp+3MIR
	peRiwtfNOw5dTmKH0QPqLvwfx2Tc9z1EZKVbVWNXMbW4lTeCwq9+y6n8Sqoze2LFNYQcz6cX0cu
	4w+pLlVlLrOvSPJSZRMQKYHNzIJ0Oa0oJXweMCgE+GYLMhEvlUz1q5BwP9Klp+HjcKeO0qTsR3O
	PlRPx40bC0EJoNYlWlE1CH7Vg4NKwbX6e75YloPuyHFI0TiOdQYeDd7DPEtWw+lu3Ox9lgkXD9A
	TG11+udg+0i8HyhGuGXsBkIS/4Ue2DogqdaK/57Rssc4tX6kPvOxyaffM8l2VQhQ7niUHJVU/X0
	xliaVDaFJucJhayfWm8B/rIiDPDELJxhrsS4n4T6oxwIiclA9Vj9oW88gBcXte499n/M/VodSIz
	O5rLrBr2J0N/bGZNIWoV4Ltilyv0mre10z2CWmKMr4iinNhRLoOI217YKeHBt/au9FlZ+sCtWuP
	sUTDxDe+2jyuAHlBbu14v1OnauyLbkiXeJg==
X-Received: by 2002:a17:90a:f947:b0:3b0:bd53:8e5d with SMTP id 98e67ed59e1d1-3b1b0b67c7emr5335875a91.58.1794683214515;
        Sat, 14 Nov 2026 11:06:54 -0800 (PST)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm14736486a91.1.2026.11.14.11.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 11:06:54 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 19:06:53 +0000
Message-Id: <DMV63QDBPR8M.OQPRTU7QTUUC@gmail.com>
Cc: "Andrii Nakryiko" <andrii@kernel.org>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "John Fastabend" <john.fastabend@gmail.com>,
 "Stanislav Fomichev" <sdf@fomichev.me>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song
 Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri
 Olsa" <jolsa@kernel.org>
Subject: Re: [PATCH bpf-next] bpf, tcx: Skip RCU synchronization when the
 entry was newly created
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Qi Wu" <shijing.wuqi@linux.alibaba.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, <bpf@vger.kernel.org>, <netdev@vger.kernel.org>
In-Reply-To: <20261114124039.111360-1-shijing.wuqi@linux.alibaba.com>
References: <20261114124039.111360-1-shijing.wuqi@linux.alibaba.com>
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

On Sat, Nov 14, 2026 at 04:40 AM Qi Wu <shijing.wuqi@linux.alibaba.com> wrote:
> Both preconditions for the grace period are therefore absent and the
> synchronize_rcu() is pure overhead. It runs inside the rtnl_lock()
> critical section, so it also serializes the whole machine's network
> control plane. This is visible when creating containers or sandboxes
> in bulk: each new netdev needs one first attach per direction, i.e.
> 2N grace periods for N devices, all serialized under RTNL.

No attach has to wait after the swap. Not only the first one.
Attach releases nothing. The old entry has to stay intact only until
the next attach or detach overwrites it as the peer.

mini_qdisc_pair_swap() has the same a/b scheme in the same hook.
It stores start_poll_synchronize_rcu() after the swap and waits
before it writes to the old buffer again. See
commit 267463823adb ("net: sch: eliminate unnecessary RCU waits in mini_qdisc_pair_swap()")

Lets do the same in bpf_mprog.
A new bundle starts with get_completed_synchronize_rcu().
Then there is no need for the 'created' check.
netkit needs no special case either.

  attach                     this patch   poll in bpf_mprog
  -------------------------  -----------  ----------------------------
  tcx, first on the device   no wait      no wait
  tcx, clsact came first     waits        no wait
  tcx, prog #2..N            waits        waits only when the previous
                                          change is younger than a
                                          grace period
  netkit                     waits        same as tcx

The diff is at the end.

> Detach, replace, multi-program chains and the error rollback path are
> unchanged.

Bulk removal has the same 2N problem.
unregister_netdevice_many_notify() calls tcx_uninstall() for both
directions of every device. Each call that finds an entry waits for
a grace period under RTNL.
synchronize_net() is expedited under RTNL.
Should tcx_entry_sync() and netkit_entry_sync() use it?

> The numbers below come from an A/B pair built from the same bpf-next
> base (2e14a351662d) with identical configs apart from LOCALVERSION, and
> all lock/RCU debugging disabled. 64 vCPU KVM guest, CONFIG_HZ=1000,

Way too long. That's 100+ lines of commit log for a two line change.
Keep the problem, the idea and one table of numbers.

> -			tcx_entry_sync();
> +			/* A newly created entry was never published, so
> +			 * there are no inflight RCU users to wait for.
> +			 */
> +			if (!created)
> +				tcx_entry_sync();

bpf_mprog_commit() records the state after detach and replace too.
They don't need it, but the next attach is never slower than today.
This is what I have in mind. The x86-64 build passes, no test was run:

diff --git a/drivers/net/netkit.c b/drivers/net/netkit.c
index 82e608e..aa15fed 100644
--- a/drivers/net/netkit.c
+++ b/drivers/net/netkit.c
@@ -770,10 +770,8 @@ int netkit_prog_attach(const union bpf_attr *attr, struct bpf_prog *prog)
 			       attr->attach_flags, attr->relative_fd,
 			       attr->expected_revision);
 	if (!ret) {
-		if (entry != entry_new) {
+		if (entry != entry_new)
 			netkit_entry_update(dev, entry_new);
-			netkit_entry_sync();
-		}
 		bpf_mprog_commit(entry);
 	}
 out:
@@ -852,10 +850,8 @@ static int netkit_link_prog_attach(struct bpf_link *link, u32 flags,
 	ret = bpf_mprog_attach(entry, &entry_new, link->prog, link, NULL, flags,
 			       id_or_fd, revision);
 	if (!ret) {
-		if (entry != entry_new) {
+		if (entry != entry_new)
 			netkit_entry_update(dev, entry_new);
-			netkit_entry_sync();
-		}
 		bpf_mprog_commit(entry);
 	}
 	return ret;
diff --git a/include/linux/bpf_mprog.h b/include/linux/bpf_mprog.h
index 0b9f4ca..e74430a 100644
--- a/include/linux/bpf_mprog.h
+++ b/include/linux/bpf_mprog.h
@@ -28,11 +28,8 @@
  *   [...]
  *   ret = bpf_mprog_attach(entry, &entry_new, [...]);
  *   if (!ret) {
- *       if (entry != entry_new) {
+ *       if (entry != entry_new)
  *           // swap @entry to @entry_new at attach location
- *           // ensure there are no inflight users of @entry:
- *           synchronize_rcu();
- *       }
  *       bpf_mprog_commit(entry);
  *   } else {
  *       // error path, bail out, propagate @ret
@@ -104,9 +101,12 @@
  *
  * Fast path accesses the active bpf_mprog_entry within RCU critical section
  * (in case of tcx it runs in NAPI which provides RCU protection there,
- * other users might need explicit rcu_read_lock()). The bpf_mprog_commit()
- * assumes that for the old bpf_mprog_entry there are no inflight users
- * anymore.
+ * other users might need explicit rcu_read_lock()). In the detach case the
+ * bpf_mprog_commit() assumes that for the old bpf_mprog_entry there are no
+ * inflight users anymore. In the attach case nothing is released, and the
+ * old bpf_mprog_entry only has to stay intact until its users are gone:
+ * bpf_mprog_commit() records the RCU state after the swap, bpf_mprog_peer()
+ * waits for it before the old bpf_mprog_entry is written again.
  *
  * The READ_ONCE()/WRITE_ONCE() pairing for bpf_mprog_fp's prog access is for
  * the replacement case where we don't swap the bpf_mprog_entry.
@@ -147,6 +147,7 @@ struct bpf_mprog_bundle {
 	struct bpf_mprog_cp cp_items[BPF_MPROG_MAX];
 	struct bpf_prog *ref;
 	atomic64_t revision;
+	unsigned long rcu_state;
 	u32 count;
 };

@@ -158,6 +159,11 @@ struct bpf_tuple {
 static inline struct bpf_mprog_entry *
 bpf_mprog_peer(const struct bpf_mprog_entry *entry)
 {
+	/* The peer was active until the last swap and the caller is going
+	 * to overwrite it, therefore ensure that there are no inflight
+	 * users on it anymore.
+	 */
+	cond_synchronize_rcu(entry->parent->rcu_state);
 	if (entry == &entry->parent->a)
 		return &entry->parent->b;
 	else
@@ -172,6 +178,7 @@ static inline void bpf_mprog_bundle_init(struct bpf_mprog_bundle *bundle)

 	memset(bundle, 0, sizeof(*bundle));
 	atomic64_set(&bundle->revision, 1);
+	bundle->rcu_state = get_completed_synchronize_rcu();
 	bundle->a.parent = bundle;
 	bundle->b.parent = bundle;
 }
@@ -243,6 +250,7 @@ static inline void bpf_mprog_commit(struct bpf_mprog_entry *entry)
 {
 	bpf_mprog_complete_release(entry);
 	bpf_mprog_revision_new(entry);
+	entry->parent->rcu_state = start_poll_synchronize_rcu();
 }

 static inline u64 bpf_mprog_revision(struct bpf_mprog_entry *entry)
diff --git a/kernel/bpf/tcx.c b/kernel/bpf/tcx.c
index 02db011..0079be0 100644
--- a/kernel/bpf/tcx.c
+++ b/kernel/bpf/tcx.c
@@ -42,7 +42,6 @@ int tcx_prog_attach(const union bpf_attr *attr, struct bpf_prog *prog)
 	if (!ret) {
 		if (entry != entry_new) {
 			tcx_entry_update(dev, entry_new, ingress);
-			tcx_entry_sync();
 			tcx_skeys_inc(ingress);
 		}
 		bpf_mprog_commit(entry);
@@ -156,7 +155,6 @@ static int tcx_link_prog_attach(struct bpf_link *link, u32 flags, u32 id_or_fd,
 	if (!ret) {
 		if (entry != entry_new) {
 			tcx_entry_update(dev, entry_new, ingress);
-			tcx_entry_sync();
 			tcx_skeys_inc(ingress);
 		}
 		bpf_mprog_commit(entry);

pw-bot: cr
