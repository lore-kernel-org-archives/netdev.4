Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711343;
	b=vqL8ghlneZ6uOH1Ad2+j9Cvmz4dN5WiZrmoLupRawKZXpKWaJUIP1ohmO8eSkyjZXLrQ
	 NV9fxicGTSLm1Tgme7LG7fkPvGde5F0SofqzsZLak40gBPjsVT0s1x6CTtQsoGq/WiKaD
	 qEgxhxm/eyPbZdWz3KvU90Ypgxzyc+XPbbBQRc1WsnDCasgF7O4097q7YVbKoDC5P0mcV
	 MRLj5mYFJzevXfw2ZV/+kp5BZMWiGr4j2oEZ1//023hYoUDcWkpNSvNaKUGBZayzlPz1z
	 l3s1C5hhfvP09um+G+UCeDCrFMOCeBwd9Nyf+ZhrPD9HE5Gn/HkJQuZws8ef7+8VHFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=vYLe6Aye6cjPeLVGkLhVr6tiV642wkKY+G+lAL+UdWQ=;
	b=n3NRnWmQeisdh89VJNH/SNKpf9Wco/6evk4jLYB0uT3P0aKn8JtdQhalJBtdCWN3Yflt
	 OBO3dWZOhBWzzwrQD44segYZfM2EKf0wQ8Hohh5ong/pwGcoP3oclROKJe88hjzWJpskr
	 jOlypGBJ7kVIlrwTP+prwC0n3hjgbyNqp/XHEq+x0XU2w3nEU8kS0tjIRspdCOuHWhNil
	 JJBVO02VpWwWmo1uIbgcvCdvKNcWkBQzuWngnlTnQSQC7IRkm6/i01oakjZDoGNhCogc0
	 zFXSuaTjJqHWyo+aLHPBVw0aGIChKb+BfqkF+fkOOtNQsRjTuKfH9Nna03ShzH/loiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ItlsisZg;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF9860A3834
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FF9860A3834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ItlsisZg
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso15255319eec.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711342; x=1796316142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vYLe6Aye6cjPeLVGkLhVr6tiV642wkKY+G+lAL+UdWQ=;
        b=ItlsisZgBsbLBK1VgS9ZB0PlWxT8mDUjm48+mrCX79lYJPOQ8c8rj5gbKOZZyF8KFM
         jVOKBW8PN0sYgzM7Wi03VpnArAY4AZH2Xk9NawKQQH//EEk9tKpTuORygFksVccHbxci
         MpeFeEYhAGypWCr/SmSEyOp+iyiJwNygswDunFOFPW/DSLJy1YzIqaNxtflbATlqzVK0
         sLtqS6AM+InztaTEtkj2pUySpHkWJVyp6EcXfTLb6cYjzuY1qViGLXM1rT4LAdJpw3s6
         5sxHptkWlX/8QJwLFOkHyesTb7NZ8DoceMB9axxcXNBHubMq129Y0H45vlCxabz05NI3
         cUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711342; x=1796316142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vYLe6Aye6cjPeLVGkLhVr6tiV642wkKY+G+lAL+UdWQ=;
        b=SleoyhDiaBauWCYZry7FcmAL0LHomKqs9f/1okvujCRqSocgo4wSgMdUxShmZ9aoBL
         lJ3jalamvLM9XSr2CmUk26KWBduUiSDk/vZfD6M92LFYct5HBSo6Nu/OR2DLuAZElv+8
         lTkpf9skR4CvEfZTQmADoPxSrIOrLZsqe2kd69t9p67LDJ5sWtlheuBmnQyRMfKUMM9T
         AR10+KwRxpruwnaigjLxd49PfovJpoP/BUgejkAXvrrCmYfQ7itGiJ3ayrlN4dRT9QLY
         EQlKQXYnQXb4sOxcS2ThPE2UYa8pR2hb3fzWFKQBlParYc62LAS7XDCaUJVdv7Ewxi/K
         F40A==
X-Gm-Message-State: APuU4Z8fzFTA/BJYgGRJDBNPR429AaLeL9zgoiMbhelhZJ7Orndfp7TY
	2o2nGqu6OnnBH5oiEWWfKAxsJlOqTVC3QIbDxDqCTdibagLArxNVl45k7IYhjHpt
X-Gm-Gg: AZFdTZdkF2QZQupe8/rOaSwxIxyU+EMWrLW5ze8lHnGwzcX5yl4Msx3RqLutvbyYH0K
	me/u8xrw30FSOfB9VzxgHN7lmP5l2bayO3ZMUKthIoWqBlkUJf0QQh69kqpR2riEVkbCkWTpIBx
	pqDhJQebmI1jCku3/7E1hGPfjEZJkS+eB6J3k8OeXiyvLAce/9TsibTVm8dIVJUa3Ugq3oL6sdi
	6QMBNUrZHFNbqihgQvA6ekcjr6mXaAav8w4JaAbrphhI8nQE0718bFFMtwoVD/qS+pBJxwwe3Eh
	4K35YNM6mmC4Bm1Rk94G/VuCVgMKtOCe+oGXl1N50vBU7jbaCM4dIbZyQhj4YpdF1UL13aKUP6O
	gX9S8k81N0GLxmhK2hkv+gU119uoWVbBa6As6v3BI9L4RxBEjaI+l+PNNYUkbQklqoCCHsjY+EQ
	D0A/Go+YT8K/rZFm8McciyMT6IEVd8kDne28gLghEFI8xykCqxzEHw3Uv5Fa6TuWXU52dGz/PJi
	j+FEfEE+pGdO3FPSKmkDys595dE9M/CkuNi0B/1uKrhrFpCNVNp7CnEClkgOl9HwLtJjX2Fibqb
	SbN9I4sELOKbpjVJsvH5MknS0jBX
X-Received: by 2002:a05:7300:c3aa:b0:385:c28b:a4d5 with SMTP id 5a478bee46e88-385c28baffbmr22699614eec.17.1795711341575;
        Thu, 26 Nov 2026 08:42:21 -0800 (PST)
Received: from ubuntu.. ([2405:201:8026:213e:d3fe:57ef:a814:ecbc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm66709770eec.28.2026.11.26.08.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:42:21 -0800 (PST)
From: mdshahid03@gmail.com
To: netdev@vger.kernel.org
Cc: edumazet@kernel.org,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	willemb@google.com,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH net v2] tcp: fix division by zero in tcp_cong_avoid_ai()
Date: Thu, 26 Nov 2026 22:11:50 +0530
Message-ID: <20261126164150.8838-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Mohammad Shahid <mdshahid03@gmail.com>

The tcp_cong_avoid_ai() function divides tp->snd_cwnd_cnt by
the argument w without checking whether w is zero.

Since w is an unsigned value, the condition tp->snd_cwnd_cnt
>= w does not prevent division by zero when w is zero.

The function is also exposed as BPF kfunc through the bpf-tcp-cc
allowlist. The BPF verifier does not enforce a nonzero value for
this argument.

Return early when w is zero to prevent division by zero.

Fixes: e78aea8b2170 ("bpf: tcp: Put some tcp cong functions in allowlist for bpf-tcp-cc")
Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 net/ipv4/tcp_cong.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/ipv4/tcp_cong.c b/net/ipv4/tcp_cong.c
index 8e83ef81fc18..f70f49b4b1e7 100644
--- a/net/ipv4/tcp_cong.c
+++ b/net/ipv4/tcp_cong.c
@@ -469,6 +469,9 @@ EXPORT_SYMBOL_GPL(tcp_slow_start);
  */
 __bpf_kfunc void tcp_cong_avoid_ai(struct tcp_sock *tp, u32 w, u32 acked)
 {
+	if (unlikely(!w))
+		return;
+
 	/* If credits accumulated at a higher w, apply them gently now. */
 	if (tp->snd_cwnd_cnt >= w) {
 		tp->snd_cwnd_cnt = 0;
-- 
2.43.0

