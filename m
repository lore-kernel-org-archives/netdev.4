Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722240;
	b=vN8qPZL2t6kVe4W4OXOo5Nybuo33swCTns4tDhDdHa4AgayIN5baD2sNcJjlJW56ppHb
	 b9FFADmA0l6AbwlwRmQuuKDfZfqoWoDO8nZIwvp+bGT4912LvecxJKsBW6I8BtiRsNCpp
	 o9VwoiKtYm2UrXbhhOwfc4ep9JF/5GqEQqwV4sE6kDPFJO0QyO1J9MN1nKzEUxwA7cfA/
	 zlshrE3Ma3gU8bntIcyQKtYceg3aE/1Vtz3sYvgpfR4njiv2MhKFQtpGSiUq0sRLOgDsQ
	 CZBT89ranU2ZCK5w5wKG9zSS5b6UqBOrr+AsyIdMFZfwxVpumqMVHq15Vk8ls6G/Fhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cTlGczEpqnTOct8RsrZ/gODErZ8owqpFldUbfmAHspI=;
	b=ibeXlxAwPbKIb6Gkg2GHqyDGeBsCWMmqCoe40GyBljxVRBuRJcODULJIvF26Uhwv2J8I
	 dZZLXjUHZX9Y0oNvBba96E/IYbIvr6way82diFHvmEEN3KO6HOidH4OdOJiazQWHbsG2E
	 TC9VMTlySWZKFpuzATFJxZ4+yzhePbUh+zxessjGOYWbrUbnEC7wYAexTYciktBBROAsp
	 sKUjRMgp6L8anHKE4iZe89W3cN/jZ6nzWUHCoGoUYT/NB90AvGVGCB5j0j8R9LvejdIwS
	 yBRmc8aPH80MGyXmWdWgQ4zLLF/xjEgvG0jfsViBnsiriLyWk/HbdnEUIVS1t+ts5eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="D/RCqXQS";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24BF606A681
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 19:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A24BF606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D/RCqXQS
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso4653526f8f.2
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 11:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795722238; x=1796327038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTlGczEpqnTOct8RsrZ/gODErZ8owqpFldUbfmAHspI=;
        b=D/RCqXQS4UeN6v20Z+VlBVJK/ZZX/cCGhIw/ilwIJBaJwk1qthCZOB7Hg/2I7i+4b3
         gXFQ4bI37t5xPPDFsxIZCp3undzL8liJl1dhk9x26M+SkiFQiV+7Vrud1K9saTD8x0sH
         UQMiTIPG1dCkfQb0PxR6z9D5p8o7O1YzP64p0tMKDD4z4PSjcjwQijNF5MccAC+MyA1q
         gLfW5lTkUooix1E3K7bTU9lw8/aq1xp6zPR8L2TbturBUIa7a3UOJhiI/2hrCU8Srmvz
         xoxkVJVoMSNteiXv1w98CN7QNYMr+TYloJe8vE9eCeJR5FzLV7xl1p9CdamhuhxKADyZ
         bRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722238; x=1796327038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cTlGczEpqnTOct8RsrZ/gODErZ8owqpFldUbfmAHspI=;
        b=U6XrqriD/kg9Nb+8/9C9HwDsKb2y8Q+AEJfCPhppXTWSVBnCD+kcvp9fSC83TGhYVD
         uoTeFUiqpo8ORS6PNazSNnyGCsfGZM5gkmg1E644yPH4ytVM4biVQwko8M+zbKmlAsNP
         ak8ZZjo16Uc2SS0YBCHaQVIf4QwW341qa9c9y/JUINwLd3xCgP/ekM4NtfdZdzx82d0u
         /7iI+lKec4l1+pnv2yDHJhiSymu6bO3NQvyCP6ISYwxtBAk9uSs17tx8skxF+sPUFd88
         fmRR3t7xlwtKT5Tvh0BMN6BaFym5QjfUZtvY5EPXPied/aQl+lZRnqKXnjtMf7TnFhUX
         I/gg==
X-Forwarded-Encrypted: i=1; AL+hErFYzTph/572ZBlkk8D0Wv5gOQ+pexW/CfyYvwTPznM+3vXMLA/lOCu7JIbdkIKuLdlw0H4BfYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fFSuyt+J7gCylZnTuibJ8P4zLca3WhH1vdke4DL4I4e7HJ3hz
	BZRbp81DimNmHfKa4XSBFdLVjVpy/3vV3Sw2hDHrD+TzSwlu7UI4xpM=
X-Gm-Gg: AZFdTZeZHCFOFXHwhaSSQOS6FwCWq59rSLc5x0S7EGoNRTnJXcrIDxAXyu94HtzGKfK
	Khpuxh8/V+98iETKwRjsf7eMt7xYwKJOcFQYyt6fWSXyG6TWWiZrgIEVlybYo5nauzvPYCnTviR
	4sy9+373wz6UGyQfpOelqVjq7vQiWvojpmcA+y2J+ETTbf+GPP1l8VMEEMfKqL3Ek5ufHzGL/Ag
	dw9oycOZGVIFetq5yfxWOhGlJy1qS0nAKRfo8RZDdJEaxd6513BHpWDKU2Viauqf0kX4HkWMEt3
	2OGXynphbrIYED2DC/uTxK1E2weFF+W8AyFQxJPQJ1loNIzmvUJwUfoHNZsd3EtJPEPh6WKcMmo
	DiVFX7fL/39tIewz2mVd7mhYXnZDS/7mHVGiJwafh1nHwRQAUhZ1W+rG6iRVussk+zTWDl6C5UL
	Pcu1TNH1yvXKiphzKKs6xscIkxsPNl3MVdfNj/3Whp7ar5IMgf8ZLREKVuwg7lzivYQ39nW/CY9
	D9xshi/oj1tQ1uNyePzy33jVTVdOGtLOKHbBarAwJiydc4VlqwuzIeUywiOnwCIFBgNKq9gWEGj
	SVgoXvtyylSeQqzSn5Y2TOK8xXm4b4LlqfRTUpv04z0hxL58Ug+CRBPqm8srCUo6rj6EyHtUK7H
	dPH7Z+mleMj+Nvw3SIiu9xncZtMCs55jSK/vPSQ9ghB6JIvGlM8+GzakFIOKWJYmpJ4TuY+b1Q7
	fqfmShunIHb+dJq5eOY1JFIZbjxEAXMYdl
X-Received: by 2002:a05:6000:25c2:b0:4a6:7781:b064 with SMTP id ffacd0b85a97d-4abb51457e8mr54433934f8f.31.1795722237966;
        Thu, 26 Nov 2026 11:43:57 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-2317-a900-4811-d431-309f-6626.310.pool.telefonica.de. [2a02:3100:2317:a900:4811:d431:309f:6626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm43663924f8f.3.2026.11.26.11.43.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 11:43:57 -0800 (PST)
From: Tobias Philipp <tphilipp@gmail.com>
To: bpf@vger.kernel.org
Cc: Tobias Philipp <tphilipp@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Thibaut=20VAR=C3=88NE?= <hacks@slashdirt.org>,
	Stijn Tintel <stijn@linux-ipv6.be>,
	Daniel Mack <daniel@zonque.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v3 3/4] bpf: Align devmap values to 8 bytes
Date: Thu, 26 Nov 2026 20:43:46 +0100
Message-ID: <20261126194347.42466-4-tphilipp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261126194347.42466-1-tphilipp@gmail.com>
References: <20261126194347.42466-1-tphilipp@gmail.com>
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

dev_map_lookup_elem() and dev_map_hash_lookup_elem() return &obj->val
as the map value. In struct bpf_dtab_netdev, val follows
"unsigned int idx" and is at offset 52 on 64-bit and 28 on 32-bit
architectures, so it is only 4-byte aligned.

devmap is read-only for BPF programs, but the verifier assumes that map
values are 8-byte aligned and accepts a 64-bit load-acquire at offset 0
of a struct bpf_devmap_val value on 64-bit architectures. The arm64 JIT
emits LDAR for it, which raises an alignment fault on CPUs without
FEAT_LSE2. The fault is not fixed up.

Mark val as __aligned(8). On 64-bit it moves to offset 56 and the size
of struct bpf_dtab_netdev stays 64 bytes. On 32-bit the verifier
rejects 64-bit load-acquire, so the misaligned value is harmless there.
Aligning it anyway keeps all map values 8-byte aligned and grows the
struct from 36 to 40 bytes. Entries are allocated with kmalloc, which
provides at least 8-byte alignment.

This patch was written with the help of an AI coding assistant
(Claude Opus 5.5).

Fixes: 880442305a39 ("bpf: Introduce load-acquire and store-release instructions")
Signed-off-by: Tobias Philipp <tphilipp@gmail.com>
---
 kernel/bpf/devmap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/devmap.c b/kernel/bpf/devmap.c
index 1b8f0d7f8..c92aa81e4 100644
--- a/kernel/bpf/devmap.c
+++ b/kernel/bpf/devmap.c
@@ -70,7 +70,8 @@ struct bpf_dtab_netdev {
 	struct bpf_prog *xdp_prog;
 	struct rcu_head rcu;
 	unsigned int idx;
-	struct bpf_devmap_val val;
+	/* The verifier assumes that map values are 8-byte aligned */
+	struct bpf_devmap_val val __aligned(8);
 };
 
 struct bpf_dtab {
-- 
2.54.0 (Apple Git-157)

