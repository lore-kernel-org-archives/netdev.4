Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795582121;
	b=WYncrjf1AZYF/CpFz9g8JfXS8InLUC11qgN2U6UV/7odtJY3sHQQ64F+t0koHo/xD7uQ
	 /G3sb19SkVT2wMQGtfp7ZAqpajemgdS7q8AHg5vyZA/SrLYB6nXPwFSecgzsg+ZahU2YT
	 Kao0hMfetkgnM6PlOx1Mi3n7XHHrwpi/A7xhw09IZ76iu/bE8FFL3d6ExoTFfllZ6uWrN
	 CugXzsBxl7RHt4HuQrCgU9LrbxNZZ9KgrU0U1CmYsKk2PsQawaKqzKoYGmuaL/Uv7CP9S
	 7oZd+MGp+SQpo9lmEi+qkcC3k+r/vLzWuQrPYAjIU+SWnwsNeM1F7/Mr5qRl0+b1fng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795582121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:Subject:From:To:Cc:In-Reply-To:References:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ibCE/HqS/x5d7xPsRoXs/I+gnefhANY9+jawDpdhc1o=;
	b=obXPZ4Hpd9YiCSAhz7o4fUGuWdbG7PKZ9PNAf7QuQt3vdLGELDEMZz9NusQ9uDrnVJVT
	 zFhfg360NVbiDkb+bbzNe2BepSlfmm/x2B9QuPiZRRfwMNMdmk+iRJZ0GklUYV1Uj7pCd
	 1+V+6ecjzjQK280hi4ZJFOLc7Q7hNRKEVq8hFeZjfhwPEjNHpR9xxiFb0XWwD5AIvggH6
	 murqftYjJufjvLB9LFc43a6iRwHro9ZpMTCirpz5JM+wXYWg6XrvhSkB4UQcoJHdiEcBf
	 akGdSYN8xR6Se0W3EFS2yEcq5RrVhTQPAb055fAvYjrEO7B9sJWYV919tU39hbIcUtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q5r8IgEQ;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16297606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 04:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16297606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q5r8IgEQ
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso2049633a12.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 20:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795582120; x=1796186920; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibCE/HqS/x5d7xPsRoXs/I+gnefhANY9+jawDpdhc1o=;
        b=Q5r8IgEQAmZbYJu/A0c1xG1xuchmY4XyU1eozZEou/bXUSlaOHvyFcCRnbc2hKTb1b
         iglr9abON268kxwAoma+YRgC3gh7pA/14dUTq5OlXiDNpbQ0+v1SFSktNKRNyNmEyiKb
         47KeutDVhlW3vsl2b9ZFlsgXdyFYmXYFlYtcyc8eOmFnqWbTn9XOJAPV+9SVeDz9p99T
         NT07Po7olJPfieXLKL1nZwScFHcb16SUup5ZGhPZCoT4TgR3YB1qpv25DyotThsL6ubO
         46H2mGwDbyEdbSgX9c3drUv7TYiUZ0x+Qpk1ecIfGHq1rj2gXUBjnXPoTpf3wktMdeMa
         FG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795582120; x=1796186920;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ibCE/HqS/x5d7xPsRoXs/I+gnefhANY9+jawDpdhc1o=;
        b=lKyxCWwe/gd/fuYX7pS58vj121Pg7FRMiSHT6XYRxAXWgknMVoaL8tPT8JH/0CV/bh
         XoyTrRus1iGztLE36AyT4C+PLB1HzSeUhB9XkpiTGa4In41G6OACGIXPhZXX5AgoivC9
         wiOf80Qo2huw28TB9osg297LFr4N0ZmSbk4eW2wEdawhxrObfIdqg8Ajk56t9AvDH/vO
         2GW+r8uoNh7J33KIz0KLF5HVg9zYQvkGXZxfmojd4/zx5ZFwCr7RojVionsIU1voFYkj
         9GjTfyzaj1e0RZdylv1IxWm0dGy5k5vqM3wQ/1fVxJzWfnFDMwXAkuns/lAfRcpUtKAD
         cYnQ==
X-Gm-Message-State: APuU4Z+wI1g7ykPNkd6FALPUAUiQPCrl/aJGfcmAyq/ilhbV6u3HoWf2
	Vz1ArlPG8+v244df8LZgSHwChYN9m+B9iuD40fIpIL7rjVA7O9DJZseD
X-Gm-Gg: AZFdTZc4A2Ei6Uj+qpIJRnyPfSPoiHiAbFlL731hznBS5+hK33/xxcODUUxcTRYd/sP
	3fYnsKPlHCpCIY84vwriC/8FqmFwfG4n/spYydtQLcBDERvUwy8FDeigpelQ1J+ebqz5rxizJ1d
	YBojB2NmZ/ZQWnne46Ay4Ol7TY5wv7qpJfcpIBt1CrBHZKVc5s/dDH/qTSSYrQQIUxXgJ4HQzk0
	fVhXN3GvJ9cfsWdBYK2xvzreueg5xw3mCp1HJI8qEJwTzLXqcsNWtlhhtNCBu2VPBZIwBqfKS7A
	xHzrBqAhyArYMm6hglhQ0XLr7RW8Gzy6aantVkS9l0DnGOhGJeAF/kOaVr9r0A/y/T5sdJrKFTq
	fCYo9wBRf+n5iRhfT7SuWVYdza2Q/+rEmf+fFcBesHdqFzFAey4RqDnHN4IPLaZrO+j9WdXZWNp
	T5xmxM1ILNFl8/QQyY+Jt40JjTaUDICGKxeAEkKPZEpo0ZVc+7LoaxfOPtCkwN6YYX/g6+a7U4O
	WL8nJzXxFUeu8U5mTzV8psVa8f/h0j99PUYaniLq3b1huleTP3adILm003H2d9ivoZHuvQj2uaQ
	WfJo4yEgTInlp9wRcEvrzpoXtKkGUOGwE37ASSkQTVwI2oUbyJAs1XmIkXzDww0oqTsPDDgER/f
	2Wq+sFTkQGZUU41R7xszMb9A9e4T3UHpsiA==
X-Received: by 2002:a17:90b:4a48:b0:3b4:1884:984c with SMTP id 98e67ed59e1d1-3b41c7b573amr15749170a91.6.1795582120219;
        Tue, 24 Nov 2026 20:48:40 -0800 (PST)
Received: from localhost ([153.61.198.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm28760169a91.15.2026.11.24.20.48.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 20:48:39 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 04:48:39 +0000
Message-Id: <DN40QM3CLBU9.3GC3UR9AVWNZF@gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: Use a 32-bit compare in the array map
 gen_lookups
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Yuan Chen" <chenyuan@kylinos.cn>, <bpf@vger.kernel.org>
Cc: <netdev@vger.kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Shuah
 Khan" <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>
In-Reply-To: <20261115102559.465375-2-chenyuan@kylinos.cn>
References: <20261115102559.465375-1-chenyuan@kylinos.cn> <20261115102559.465375-2-chenyuan@kylinos.cn>
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

On Sun, Nov 15, 2026 at 02:25 AM Yuan Chen <chenyuan@kylinos.cn> wrote:
> Use BPF_JMP32_IMM() for the three compares, as commit 70504de0bb62
> ("xsk: Use a 32-bit compare in xsk_map_gen_lookup") did for
> xsk_map_gen_lookup().

bpf-ci is right. The sparc64 JIT has no BPF_JMP32.
build_insn() returns -EINVAL for the new compare.
Every prog with a lookup in an array loses the JIT there.
With CONFIG_BPF_JIT_ALWAYS_ON the load fails with -ENOTSUPP.
The riscv64 JIT adds two zero extensions, one for r0 and one for the imm.
The bug needs a map of 16 Gbytes.
imo it's not worth changing the code of every lookup for that.

can we skip the inlining for such maps ?
map_gen_lookup() returns -EOPNOTSUPP, like for BPF_F_INNER_MAP.
bpf_do_misc_fixups() then calls ops->map_lookup_elem().
All three compare u32 with u32.
The emitted code stays the same for all other maps.
Then patch 2 has nothing to check. Drop it.

bpf_do_misc_fixups() has the same compare in front of bpf_tail_call().
With max_entries 0x80000000 the index 0x80000005 calls prog 5.
The diff doesn't fix that one.


diff --git a/kernel/bpf/arraymap.c b/kernel/bpf/arraymap.c
index 508706d..89c22c7 100644
--- a/kernel/bpf/arraymap.c
+++ b/kernel/bpf/arraymap.c
@@ -227,6 +227,10 @@ static int array_map_gen_lookup(struct bpf_map *map, struct bpf_insn *insn_buf)
 	if (map->map_flags & BPF_F_INNER_MAP)
 		return -EOPNOTSUPP;
 
+	/* The imm of BPF_JGE is sign extended. It cannot hold such max_entries. */
+	if (map->max_entries > S32_MAX)
+		return -EOPNOTSUPP;
+
 	*insn++ = BPF_ALU64_IMM(BPF_ADD, map_ptr, offsetof(struct bpf_array, value));
 	*insn++ = BPF_LDX_MEM(BPF_W, ret, index, 0);
 	if (!map->bypass_spec_v1) {
@@ -302,6 +306,10 @@ static int percpu_array_map_gen_lookup(struct bpf_map *map, struct bpf_insn *ins
 	if (map->map_flags & BPF_F_INNER_MAP)
 		return -EOPNOTSUPP;
 
+	/* The imm of BPF_JGE is sign extended. It cannot hold such max_entries. */
+	if (map->max_entries > S32_MAX)
+		return -EOPNOTSUPP;
+
 	BUILD_BUG_ON(offsetof(struct bpf_array, map) != 0);
 	*insn++ = BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, offsetof(struct bpf_array, pptrs));
 
@@ -1496,6 +1504,10 @@ static int array_of_map_gen_lookup(struct bpf_map *map,
 	const int map_ptr = BPF_REG_1;
 	const int index = BPF_REG_2;
 
+	/* The imm of BPF_JGE is sign extended. It cannot hold such max_entries. */
+	if (map->max_entries > S32_MAX)
+		return -EOPNOTSUPP;
+
 	*insn++ = BPF_ALU64_IMM(BPF_ADD, map_ptr, offsetof(struct bpf_array, value));
 	*insn++ = BPF_LDX_MEM(BPF_W, ret, index, 0);
 	if (!map->bypass_spec_v1) {

> Fixes: b2157399cc98 ("bpf: prevent out-of-bounds speculation")

Wrong tag. At that commit array_map_alloc() has:

  if (array_size >= U32_MAX - PAGE_SIZE)
          return ERR_PTR(-ENOMEM);

elem_size is 8 or more, so max_entries is below 0x20000000.
The same is true at 81ed18ab3098, which bpf-ci proposes.
The limit went away in commit 1bc5975613ed ("bpf: Eliminate
rlimit-based memory accounting for arraymap maps").

pw-bot: cr
