Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449185;
	b=eiFl8ObsDr3mgpJriT2ciATotH9LgjvRMqUilexnnumbYxgOhVkrMUzyNpGgiQQAXUm3
	 hQwPgPXmdh41OEqMW9XhTJdnGbhidV06Zv/5+Z7GykKbsIrlD496OqshReqLIg7m+nvHD
	 wX6o/aUgIfOwErLS2XoYOQh/nWEcJ1PYa9dbtjKhOudZmkgc1b9eLWP1Dz8VpoLQ+65ZB
	 RWdVvsjnMLXfUPPCnYJUx1Cj7O72QcuzLPxVrIwetfaX9qWhNq2OXPGZc82ygCGKD7r0E
	 t7ZPmoVM3Zu8vXsinC+xmqDuI4mruibyw0lqJoy+lj/+wAODhv9NCmrq9uA0ifyDo2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PSpHWfHbUQIG3jx3ObKDcv5uRfpQODJi2pWjJnhhS0w=;
	b=Z3x5geEt7QsmnfqX2T0BoKjvMahHBCV7KqttAmKRwc87a34K4AmzJMOSo3vkBcVCynkK
	 yuADUITpUfgQp5yStu2TXKbjw+s4ZMI0esNzKvL+5vISNRp3kOcg4xQz9qhAiqWmQlXQG
	 0+pnqAlS3/CiGNq3eudjTufN0Kt9gW02yvvdsUw7maonJiDvEFMAKrXqIPpznEo+1x0hd
	 PrHeQk9zin2f5LAkRer9pQo5bI0bhaYkK9uoUkeN6iQOHYHIuYHgiuCdOsUF1o11Zz9+1
	 9FWvrnkQlIFSXVcA3fz76pbxigiFyYcbPLhl6iU0S9H05kVcKqnY4GLoZwJcx2TIgkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UwRs8qNn;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35763606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 15:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35763606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UwRs8qNn
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so2764676a91.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 07:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449183; x=1796053983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PSpHWfHbUQIG3jx3ObKDcv5uRfpQODJi2pWjJnhhS0w=;
        b=UwRs8qNnEt2Qjt77vZmeJR/wZ9osqFbOpX4n+bGrK97PAqtti65W73nc0kS16pVGr8
         9e5MOy8l+wGgfDsWzbTppU1CPJGe9EiHYczxZv6L4uNp3jd53zE/hcupmFL5T3qC1Wqd
         LNWpCSSLWrVgPKfI3ARkkwlGRQNeBhLePleT/5mKHt+wcRETDAZKWhuBJrfZzRq7PzVF
         DXEgUwVrFC6pszjoM3LjakxZhbou3pVlNqmLrHrz7eZRmcrjcegqWyQkvJ2q3NB7DhvV
         KLJkpnhp7zghipS0A92L+GKyndphofIZTQdYUeh4M+PlrVXLsShLKLlU4AKHfowkmasE
         BgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449183; x=1796053983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PSpHWfHbUQIG3jx3ObKDcv5uRfpQODJi2pWjJnhhS0w=;
        b=WVLWqgtmit7F+kqRPA8kjkR5w12znYMcJx9voxQpAvRtiBkYHhQ2jTlOfpAgCKQiiP
         WxyQxPK/Bf7AyuJPsqyZX06ZZ1xQ1zGSiGTNTZmVPGprDAteXkO6feLJjfeFWeRqzBk+
         oIqjykIBEpGYS7+8lc8SNwda/n78tKTKNVgv7OeU6dATIIKqUUgomjGUm1eG1Ee0nUVG
         SK6VA1ywBL2N6qLYJX93zjFJuiQi2AbNVNoPmlrx28Rcxo+jwr4xBdVotnUPBO57keB6
         e5ClD8dF5pgbrymHQlhBvf6Arkt/wALGI1ztTbU3V/HdwqwoITJCLSXrIgiaYwdGX3MW
         nong==
X-Forwarded-Encrypted: i=1; AL+hErE6ccI6qYy/1+POnwIx9c4SRj9pDwGQeravB6ebrHggdAiorXiSgOsInTgWLeSKkjJlOuogrqg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6+/mPuRKkgGGWhPQEZxDjx7EnaeFO2akTgJyzj4EbrYYjujHT
	Oww4b29xGWszIyDrFvQ3rCmhuEbEnTzeEGlBXL7rlngdPrSH3IalIc4C
X-Gm-Gg: AZFdTZeUF9vHxykUhDZysJ897t+suGiiI5FkK5KgWYCcoiV3t+mjgQzmUpGKiEpRs2/
	j2hJKKa+2SlSgKIEwDbxRy3gICgZcrGYSV+dcq2gy91PgZTRa7Br9zdRbj4D9Ek6Lnu1cDOQvsZ
	45xGpp1EfL3010VDT7JBEBYzVxTPAuSd/zrehrLhOfsl8oL6EFeedoFG4lCvJcJ/6AP3RrTL7Lf
	JVaewHKtHdZdYYnzNGXHlqjzn+1CZO36oDDaMNobXb8/b749Adc1LxFmOO47hHTRljeiNu712Sg
	q8lbU6fV0C4jatbbLgxCLF/EFgWFDqQO1iaV9Ap6X1Wgz/b42hIEnQhdsEkKdI/GZ3c90Yvq28n
	gCL8NbNG3tt3tY2TsqmkVMzk6TFzixxWUc1pkqSumiBPc1ssamqW5fPLyW77jKLISG4xP8rGvpw
	iuHPFv+vQvFM5b1elvI02rMSswlSgmMqhYq6Y4qX/KwJPDbs26mqTmLSJfT8chxvWpFv1OoBvXn
	iGn0Y/MIlYzu5Otkfp/ZoGIPSbwvWIlQGEIGzzEy0WncMNN0llv9QXmagyPz619U2LF9ZJue+XD
	Ym2Q2h6sReB4395CMejRCTUswBPJunHn9punOgtOeII=
X-Received: by 2002:a17:90b:4483:b0:3b0:9deb:d991 with SMTP id 98e67ed59e1d1-3b41c92cbb8mr11195881a91.35.1795449183417;
        Mon, 23 Nov 2026 07:53:03 -0800 (PST)
Received: from LAPTOP-G6J9COQB.lan ([113.11.180.16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d96bd3sm21596601a91.12.2026.11.23.07.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:53:03 -0800 (PST)
From: Ahmad Wicaksono <supersonix03@gmail.com>
To: bpf@vger.kernel.org
Cc: jakub@cloudflare.com,
	mhal@rbox.co,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	davem@davemloft.net,
	kuba@kernel.org,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	linux-doc@vger.kernel.org,
	netdev@vger.kernel.org,
	Ahmad Wicaksono <supersonix03@gmail.com>
Subject: [PATCH bpf-next v2 2/2] Documentation/bpf: Fix stale selftests file references
Date: Mon, 23 Nov 2026 22:52:00 +0700
Message-ID: <20261123155200.16676-3-supersonix03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123155200.16676-1-supersonix03@gmail.com>
References: <20261123155200.16676-1-supersonix03@gmail.com>
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

Two selftests paths in the BPF docs no longer exist:

map_lpm_trie.rst points at tools/testing/selftests/bpf/test_lpm_map.c,
which was moved by commit 3e18f5f1e5a1 ("selftests/bpf: Move
test_lpm_map.c to map_tests") and now lives at
tools/testing/selftests/bpf/map_tests/lpm_trie_map_basic_ops.c.

btf.rst points at tools/testing/selftests/bpf/test_xdp_noinline.c, which
is now tools/testing/selftests/bpf/progs/test_xdp_noinline.c.

Update both so readers can find the code.

Signed-off-by: Ahmad Wicaksono <supersonix03@gmail.com>
Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
---
v2: No change.

 Documentation/bpf/btf.rst          | 2 +-
 Documentation/bpf/map_lpm_trie.rst | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/bpf/btf.rst b/Documentation/bpf/btf.rst
index b61881239..94a81a9e9 100644
--- a/Documentation/bpf/btf.rst
+++ b/Documentation/bpf/btf.rst
@@ -1148,7 +1148,7 @@ information.::
 The following is an example of how line_info can help debugging verification
 failure.::
 
-       /* The code at tools/testing/selftests/bpf/test_xdp_noinline.c
+       /* The code at tools/testing/selftests/bpf/progs/test_xdp_noinline.c
         * is modified as below.
         */
        data = (void *)(long)xdp->data;
diff --git a/Documentation/bpf/map_lpm_trie.rst b/Documentation/bpf/map_lpm_trie.rst
index f9cd57949..37ef39d0b 100644
--- a/Documentation/bpf/map_lpm_trie.rst
+++ b/Documentation/bpf/map_lpm_trie.rst
@@ -108,9 +108,9 @@ specific keys before less specific ones.
 Examples
 ========
 
-Please see ``tools/testing/selftests/bpf/test_lpm_map.c`` for examples
-of LPM trie usage from userspace. The code snippets below demonstrate
-API usage.
+Please see ``tools/testing/selftests/bpf/map_tests/lpm_trie_map_basic_ops.c``
+for examples of LPM trie usage from userspace. The code snippets below
+demonstrate API usage.
 
 Kernel BPF
 ----------
-- 
2.43.0

