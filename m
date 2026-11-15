Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794785311;
	b=NFUbgD4o3g59lf0OqROfghaSU8Ey3YAlwMH4/6FC5Rw+wZlrTzK5EwXZNkVsNCfZRJMA
	 ALXljqR1Dtanaq+VaIDVW3ytMmtCECLVnHVctIATFrZAAneFrNdnQJf643DUjjWCdUYkQ
	 vxRDUidBDvXggbOs2WOcY4lamkhMqPzAZeGhJ/6qVN9Ckuntjay28hAJG12udT5XdmWmx
	 L/COVD5RWhAd3Bw3dnVr4zqw4dIjkin02hOamNfRSAv1F8gB+vaJrAdMALlQR6k614fr+
	 vIHFBN0pNqw/PhhvgFjGcYC8jQiPHtMPnJ1aRQfZGz/aJap5we1klJHpqeOACBW+8kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794785311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=UBeykY1+H/vPJmkPV2pLCmI2Bs+Pj25kP6+DXgtUhEg=;
	b=q2qkVUPye2nDekdb7IYa1SbKuYCt0MvixRfSulW+CZE1Dg1E6Zk0BXSaN7FUrEB4kyQE
	 +8Krw9aHxVXVLPR00mWeYE2xpbSQcg6y/gcoEjfts1nal9g1KCL1DUSbak01EUrRyhf1j
	 eAXtOffRGzUjQTB4+KIa+7G5pVAqMCxAQYUdwrIYQ3ao8TDYO0HyWw/ydcWbcNgIBo6G9
	 WZKVctCAsbZqXxlyr/+0MJAK10BrDRyt9h1HJOTMib+AhuSTbL2uSTOzK1TnpZB0eVRzM
	 neSMdbAhSoOzngNhwPa0x+XEignji/ffsVjSIlj8ZwCByzlOEF06hX7vY6RBbKm2MuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R4X8Y8HY;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089D9606A323
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 23:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 089D9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R4X8Y8HY
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ed28bac8d7so11805275ad.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 15:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794785310; x=1795390110; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UBeykY1+H/vPJmkPV2pLCmI2Bs+Pj25kP6+DXgtUhEg=;
        b=R4X8Y8HY8JvXK9sdMGMllaKudzpsfMfDLWS/qg6c0goxa2kUGuYQv/8mPEQn7MTQwN
         9RpdlbNq0uFqewcYwl+PkyM/jUdR6c5AkuMetaUc3nP6yyslFlaUUprBo0FDyhiCpcx1
         0nqgdtFlgbGe4nQG7wQaHZtPTeB6PxsPL4ESMRO1CCXaBMoVQKRwYCZ/4nuE0Wal6v+N
         8530jNemiaGvpVK93xW7ndcQ9X3tvuspHUk6ZlHK/ECwo1u0FgJ8qU6+DVzh6IEaCW1E
         z1cI3F9z5KnNORNVANdIaxAI9mLinedBuq5zYc/IKacgWB6knVUmOcAeyTaNsxctGQgz
         6VNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794785310; x=1795390110;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UBeykY1+H/vPJmkPV2pLCmI2Bs+Pj25kP6+DXgtUhEg=;
        b=iKFq9un7RI/4mq+olhbKcNW5d0hFC6Q38gxUZsMTF20tW/Hhj8BjU3XjuXgNXhhhrB
         YDlfOGuP+F0vUbMKVK84JfqWjcgEHSSRy9nMWG+G6g/gMCFbvnqhj2IavOqWCWcTQwsA
         E/9Q8XkD1jZuSW21ZPhgURF/pqjt0HvGa24ciIAMmJub9vpDEysg9J5tDK+PwLiYUzYx
         8IiWIleE4xuNvjY54nVBhUL9FvKENHu1x9/ZcW8IB/L3mk1gFgVAf2Jm74wOZcsIZG8q
         /onZ6ISpuapdNvgBb4SQ3nTb2XppmKRyHQvGrpbBrLg9Pc1E6dgGZHw2X7ytPtSqsKkx
         AeJA==
X-Forwarded-Encrypted: i=1; AL+hErG3X8qA2w0PBqjXmsl63hLFI6V2pbym7nglTaBYZG8mOd+F99Nrd/WJpQv+AuTj7SwzX+jcucw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2fKdg4UfjjUrYKlhkeboxqIAJn2qjvb92tjW6PKWQMg81dA2i
	Y9wGn1mr/DN/ieVUToHd0xRMUmsLvmuIpJ/jT89kl5MGuZyyrIKVBQSe
X-Gm-Gg: AYBFou1JglKcHIE7smSOjAZAQf7y9XBNu/v7zgfOU6Bd/f4wutdtLNzOJECUQO8yyVJ
	znBDPIpknTBZLTn+5mzh5DV/L4LmzO4Hl/sZ95FS/2M4ElodwX0rS1NhWj54CNqkLCcsjANDGBG
	VHkrJUvZ9fgZXcuPqphZwdjQ8qLnVsNjYJWjO9zP62cBBj7tANqIOcP/GJ9lrr5UjGC9uxOxQFE
	9Xe7gyr2o05iW9N0TkBRORk7MeBvBJNC/1K/USv//SO2vMooO5Y117sfvzcUeqoIJxnYU60y3Zp
	t7kTWhFJaWiYGk9UXWUe1aAzMHVMkuMfl8v7/HjDQhHnbAIDCLzx2KLeNEjQPJq8+qW+4hQeKkR
	KrE9+uX3VGmBlrmQrGtMVVEcUMiWYLwSvx5P4h/YOkjCYhO+mD3RaIK30GGefz7MKbVqEz/sR7O
	CaVkaJldIjPstj3MhKmK4/DZlGtvCKEkyiB3XiyWffWrRtgoaQX/Tq8YTu90de+W61W1WAM1UBQ
	4mLvgZr0vdmi5YH1DcJjNiUgrxDx+ZpaiV+EPNd6BB84XZwKmfVK/R2ksBnQ+qaU0jizqBVQFDX
	ZVB2T42bwRNz3TJ8PukuD3cQL32fljW7z/4juwysCR5GUOcv5XE3Re5M0a5eob9Mf3Z+R3CJuAj
	heYNhrKD2DGMeGSMwr1ErSw9peVUM40U4yg==
X-Received: by 2002:a17:903:2a87:b0:2e9:199c:f800 with SMTP id d9443c01a7336-2edf2212d5cmr82331265ad.37.1794785310143;
        Sun, 15 Nov 2026 15:28:30 -0800 (PST)
Received: from localhost ([153.61.198.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75b467sm30194865ad.20.2026.11.15.15.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 15:28:29 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Nov 2026 23:28:28 +0000
Message-Id: <DMW6AKE8C8K5.H33UQQDOD34J@gmail.com>
Cc: "Martin KaFai Lau" <martin.lau@linux.dev>, "John Fastabend"
 <john.fastabend@gmail.com>, "Stanislav Fomichev" <sdf@fomichev.me>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Eric Dumazet" <edumazet@kernel.org>, "David S
 . Miller" <davem@davemloft.net>, "Andrew Lunn" <andrew+netdev@lunn.ch>
Subject: Re: [PATCH bpf-next v2] bpf, mprog: Defer RCU synchronization until
 peer reuse
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Qi Wu" <shijing.wuqi@linux.alibaba.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Nikolay
 Aleksandrov" <razor@blackwall.org>, <bpf@vger.kernel.org>,
 <netdev@vger.kernel.org>
In-Reply-To: <20261115144556.41927-1-shijing.wuqi@linux.alibaba.com>
References: <20261115144556.41927-1-shijing.wuqi@linux.alibaba.com>
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

On Sun, Nov 15, 2026 at 06:45 AM Qi Wu <shijing.wuqi@linux.alibaba.com> wrote:
> An attach within a grace period of the previous change still waits
> (e.g. a tight loop); spaced-out attaches do not. Detach retains its
> post-swap synchronization; peer reuse can add a conditional wait
> before a detach. Functional checks pass and a 300-cycle attach/detach

The extra wait before a detach was my suggestion, sorry.
I looked at the next attach only.

A detach that follows a detach or a replace now waits twice.
The first detach waits in tcx_entry_sync(). The old entry has no users
after that. Then bpf_mprog_commit() takes a new state, and the next
bpf_mprog_peer() waits for it. Nothing needs that wait.
A replace doesn't swap, but it takes a new state too.
To close N links of one hook takes 2N-1 grace periods under RTNL.
Today it takes N.

Grace periods that the second change waits for, when it comes within
a grace period of the first one:

  first     second    today   v2   diff below
  -------   -------   -----   --   ----------
  attach    attach      1     1        1
  detach    attach      1     1        0
  replace   attach      1     1        0
  attach    detach      1     2        2
  detach    detach      1     2        1
  replace   detach      1     2        1

In the attach/detach row the attach saves one wait.
The sum is the same as today.

Pls add "detach after detach" to the table of numbers.

> @@ -243,6 +251,7 @@ static inline void bpf_mprog_commit(struct bpf_mprog_entry *entry)
>  	bpf_mprog_revision_new(entry);
> +	entry->parent->rcu_state = start_poll_synchronize_rcu();

Only the swap in attach needs the state.
Lets take it there, in place of the sync that goes away.
Detach and replace leave the old state alone. bpf_mprog_peer() waited
for it already, so the next change doesn't wait.
The build is clean on x86-64. I did not boot it:

diff --git a/drivers/net/netkit.c b/drivers/net/netkit.c
index 82e608e..75a1a56 100644
--- a/drivers/net/netkit.c
+++ b/drivers/net/netkit.c
@@ -772,7 +772,7 @@ int netkit_prog_attach(const union bpf_attr *attr, struct bpf_prog *prog)
 	if (!ret) {
 		if (entry != entry_new) {
 			netkit_entry_update(dev, entry_new);
-			netkit_entry_sync();
+			bpf_mprog_defer_sync(entry);
 		}
 		bpf_mprog_commit(entry);
 	}
@@ -854,7 +854,7 @@ static int netkit_link_prog_attach(struct bpf_link *link, u32 flags,
 	if (!ret) {
 		if (entry != entry_new) {
 			netkit_entry_update(dev, entry_new);
-			netkit_entry_sync();
+			bpf_mprog_defer_sync(entry);
 		}
 		bpf_mprog_commit(entry);
 	}
diff --git a/include/linux/bpf_mprog.h b/include/linux/bpf_mprog.h
index 0b9f4ca..2e180a4 100644
--- a/include/linux/bpf_mprog.h
+++ b/include/linux/bpf_mprog.h
@@ -30,8 +30,8 @@
  *   if (!ret) {
  *       if (entry != entry_new) {
  *           // swap @entry to @entry_new at attach location
- *           // ensure there are no inflight users of @entry:
- *           synchronize_rcu();
+ *           // nothing is released, no need to wait for users of @entry:
+ *           bpf_mprog_defer_sync(entry);
  *       }
  *       bpf_mprog_commit(entry);
  *   } else {
@@ -104,9 +104,13 @@
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
+ * bpf_mprog_defer_sync() records the RCU state after the swap, and
+ * bpf_mprog_peer() waits for it before the old bpf_mprog_entry is written
+ * again.
  *
  * The READ_ONCE()/WRITE_ONCE() pairing for bpf_mprog_fp's prog access is for
  * the replacement case where we don't swap the bpf_mprog_entry.
@@ -147,6 +151,7 @@ struct bpf_mprog_bundle {
 	struct bpf_mprog_cp cp_items[BPF_MPROG_MAX];
 	struct bpf_prog *ref;
 	atomic64_t revision;
+	unsigned long rcu_state;
 	u32 count;
 };

@@ -158,12 +163,23 @@ struct bpf_tuple {
 static inline struct bpf_mprog_entry *
 bpf_mprog_peer(const struct bpf_mprog_entry *entry)
 {
+	/*
+	 * The peer was active until the last swap and the caller is going
+	 * to overwrite it, therefore ensure that there are no inflight
+	 * users on it anymore. Paired with bpf_mprog_defer_sync().
+	 */
+	cond_synchronize_rcu(entry->parent->rcu_state);
 	if (entry == &entry->parent->a)
 		return &entry->parent->b;
 	else
 		return &entry->parent->a;
 }

+static inline void bpf_mprog_defer_sync(struct bpf_mprog_entry *entry)
+{
+	entry->parent->rcu_state = start_poll_synchronize_rcu();
+}
+
 static inline void bpf_mprog_bundle_init(struct bpf_mprog_bundle *bundle)
 {
 	BUILD_BUG_ON(sizeof(bundle->a.fp_items[0]) > sizeof(u64));
@@ -172,6 +188,7 @@ static inline void bpf_mprog_bundle_init(struct bpf_mprog_bundle *bundle)

 	memset(bundle, 0, sizeof(*bundle));
 	atomic64_set(&bundle->revision, 1);
+	bundle->rcu_state = get_completed_synchronize_rcu();
 	bundle->a.parent = bundle;
 	bundle->b.parent = bundle;
 }
diff --git a/kernel/bpf/tcx.c b/kernel/bpf/tcx.c
index 02db011..12a1620 100644
--- a/kernel/bpf/tcx.c
+++ b/kernel/bpf/tcx.c
@@ -42,7 +42,7 @@ int tcx_prog_attach(const union bpf_attr *attr, struct bpf_prog *prog)
 	if (!ret) {
 		if (entry != entry_new) {
 			tcx_entry_update(dev, entry_new, ingress);
-			tcx_entry_sync();
+			bpf_mprog_defer_sync(entry);
 			tcx_skeys_inc(ingress);
 		}
 		bpf_mprog_commit(entry);
@@ -156,7 +156,7 @@ static int tcx_link_prog_attach(struct bpf_link *link, u32 flags, u32 id_or_fd,
 	if (!ret) {
 		if (entry != entry_new) {
 			tcx_entry_update(dev, entry_new, ingress);
-			tcx_entry_sync();
+			bpf_mprog_defer_sync(entry);
 			tcx_skeys_inc(ingress);
 		}
 		bpf_mprog_commit(entry);

pw-bot: cr
