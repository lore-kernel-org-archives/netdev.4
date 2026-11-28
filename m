Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795848013;
	b=0F7LBlVvmWiA289BANrZnBe9nnECKdDCQ4YsCJvseroqDsdh0oB3GZO0vtjaRw3bffz5
	 14eEl8lXzk4wCXf0D1DeSk89f+i3nMPPKEXZ4mbH8CWNh7ZD6Gf705+VXtQxcco9gWjs0
	 TGB0MWxNLAzr1JvNejvF4ivai6qaH3NXHR/SBaRDz8XTfpfXMXLxi+mRuZHDRwJYmh0EF
	 l8+hPQqnTVFhwhpRj7nP+3/ah9JCeaEf30jWH32q11V5FIzxSdyPMz2rW4gcHZ9ebmInZ
	 cFmRqkToLe8EScUem7TwyQ6qJbinblx3IBWxk3qxWt9Yiko4jDukwMm2GAaguQO8cKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795848013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o2jiG9+xAFUlof07zbkq4cg2hbIJFqihTUGeaXhVu6k=;
	b=cAsLlNNjH4erB7vX6UqSBhQ/z6kTEztltYG5ltSErZiPtzsjkPmN/Qrdk6X+zXrKSgw4
	 /A6ehFjY4FOSDCOm18/oIUpN/GC3yQhDnIDhJfx3rxelwEKb6bsy0VqMjHkXYDRvE9BD2
	 PD5UTvJhpQ+v47DiRiD8qh32Bn72tTq9n0b57RP1eyX28TgD/lQFDK7TJnXo6ogqXIipn
	 83NYAtmfBE1LwCNCUhs4tVWK1qn5IvdKbhtrARwQGPMYyhIbbjn9myfMXcjVO5TpD1uGA
	 Br8T6YZlUKo174M1GOR2bKMBe9RM1mttJO2ld3LT0Es4t+wn1wjnbdlUzjB5PDVpo1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MD+kReW7;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4768E606A331
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 06:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4768E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MD+kReW7
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b546061d58so20614622c88.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 22:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795848012; x=1796452812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2jiG9+xAFUlof07zbkq4cg2hbIJFqihTUGeaXhVu6k=;
        b=MD+kReW7o9d4GF9cXufW1M2buf93DEbh/wjz1E0RaHWnybClSSk0JQdq6WJGk/Lh1g
         LF7jwixSgdG4M0twgCfgemiGKH4EvV5AitxCersS+fYqDbjGCvhcVZ5e12lqPe7nwC8o
         G5wsWmS3FnbsDwVmN7Re9f5d0UvHLs8SF2l7SvOa3nzkNV4nxDUoI2Df2FR4P0R1NSrJ
         6MGFmEQoNhV830omPWftHGWCOiIlsqwdl2LQDcjx2LCz7MgA1Cv6BLML1iWBCQiQaQcK
         PSpCWJ28XN2tKBf24E/6a1wabGt68W+VQkHxEBoc4QTw1Hh2GwgqNJFzZxDGbRkAOmph
         m/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795848012; x=1796452812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o2jiG9+xAFUlof07zbkq4cg2hbIJFqihTUGeaXhVu6k=;
        b=YDgvs0ZDDTiYSK+tadYCRBU0aju+TqdfnF38nBR7PZ/bGVBx9kUc4LxHQuONQDjn5g
         P/pf1rN/ZFvr57HNZub+eTHQik7mKpe+DjFTtYMoyFGmlmxvk5TYGNaLOdP3jdX91sdO
         z9mxoDDMU7PNZOZ6r9rUJHgK8A8cKkgBeO50eJRGoX7Z5a1Y97wG3yeRUix/M4daGLya
         zwpgJIjRCGlMHpofCExzqA6sVzmFcnlr2BfKk7Rb0VAO7BT/k6r0Mm/mwHL1lVAL/8/x
         XXxcPQS0IDLpIdPiBWCyhLkbTkUiwY8v3M6z1fIB4aB0Tk/cvePLJ8jfmljyV/cZyrH4
         OmZg==
X-Gm-Message-State: APuU4Z9J1C4Q25G3XvvG2/6UHmMoANzVp2fDtJM0aNK5j66T0WFumAKP
	Af4Fe43bxvIvjCxJCgG6A/MIudwYCFwe3RUR7CYWA7zjFvIHvUzYDyLHDY/GGg==
X-Gm-Gg: AZFdTZftJA3LlRfIYilJJ5f5Xvzb7hi+SBl3mP4ZW1YJAOIQMyw9ySRL451IfoJJx1U
	mQj5r7BWCTcLg3td8aR/Oga+xoAxSkrR7Kph/FPPQ/vml6MlhyhdoiWhuKMFDMulAwBS+tmRTHE
	mR2Trc6kllpPoUX4NZjINLLIhkiWMW4DK9cyPmR/2BSi4rMij2/RA0hNEwJT8QGgGmiEI/wESAt
	8XWYvbOaTHB9qH7Gr7tO3W7Fkbaijt5jd7t3N8uJOiu2Si4/WVRAwUbogjIrmDJ8D7LHnJ/1GNB
	bAhy5u9QO097KG7k8PJeqLvjn7FmqkeS8BUJ0tt7ttzBxwqtNwIIpVRXJdbXMY48vGxXXmfWAX7
	Vhvu9VNCLCG6NfIfyL06zFv7vD4MdT23J4az+Bx5P8fHRJiEFRQCYQqioDbPnmoMy9sqhr7I9dO
	RexeVkmRGsWwerY+GPOe82Bj00qPis93H39jgLd8pgiJevrgCAULmfdDCJS9YqXHSATb/aPhFV6
	6wCihhL5IPFndQxWfHVou1W6KrsNc8Ga5sZKfmGmjZaUX9fFIRTLQZTble6aOlGL613HaRHFtZ1
	GPvQKeY9sWvnnYurTXIaT5ORbVeVVqtba6H6p1j3UunEPE3HV8MbvyLbZakbozUopyJj2PiWes9
	kyYCp8UapXvPmbvdq6rVBPFDnf+HUo76G8REk+LZNEsqd/cxeWmezLPxInHUx7OcNjX4=
X-Received: by 2002:a05:701b:4308:b0:165:aced:1fde with SMTP id a92af1059eb24-1b56f87a910mr17512911c88.0.1795848012234;
        Fri, 27 Nov 2026 22:40:12 -0800 (PST)
Received: from l ([2603:8002:ea00:6800:c936:de14:80b6:30c0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm60446286c88.2.2026.11.27.22.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 22:40:11 -0800 (PST)
From: Dave Seddon <dave.seddon.ca@gmail.com>
To: netdev@vger.kernel.org
Cc: Dave Seddon <dave.seddon.ca@gmail.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	David Ahern <dsahern@kernel.org>
Subject: [PATCH iproute2 v2 2/2] ip xfrm: drop the cast of RTA_DATA() in deleteall
Date: Fri, 27 Nov 2026 22:40:08 -0800
Message-ID: <20261128064008.2028008-3-dave.seddon.ca@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261128064008.2028008-1-dave.seddon.ca@gmail.com>
References: <20261128064008.2028008-1-dave.seddon.ca@gmail.com>
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

Remove the (void *) cast on RTA_DATA() in the two deleteall callers.
RTA_DATA() already yields a void pointer. No functional change.

Signed-off-by: Dave Seddon <dave.seddon.ca@gmail.com>
---
 ip/xfrm_policy.c | 2 +-
 ip/xfrm_state.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/ip/xfrm_policy.c b/ip/xfrm_policy.c
index 1a41f2a9..a673cbb2 100644
--- a/ip/xfrm_policy.c
+++ b/ip/xfrm_policy.c
@@ -783,7 +783,7 @@ static int xfrm_policy_keep(struct nlmsghdr *n, void *arg)
 
 	if (tb[XFRMA_MARK]) {
 		int r = addattr_l(new_n, xb->size, XFRMA_MARK,
-				(void *)RTA_DATA(tb[XFRMA_MARK]), RTA_PAYLOAD(tb[XFRMA_MARK]));
+				RTA_DATA(tb[XFRMA_MARK]), RTA_PAYLOAD(tb[XFRMA_MARK]));
 		if (r < 0) {
 			fprintf(stderr, "%s: XFRMA_MARK failed\n", __func__);
 			exit(1);
diff --git a/ip/xfrm_state.c b/ip/xfrm_state.c
index 7e365b19..a2e0ed08 100644
--- a/ip/xfrm_state.c
+++ b/ip/xfrm_state.c
@@ -1203,7 +1203,7 @@ static int xfrm_state_keep(struct nlmsghdr *n, void *arg)
 
 	if (tb[XFRMA_MARK]) {
 		int r = addattr_l(new_n, xb->size, XFRMA_MARK,
-				(void *)RTA_DATA(tb[XFRMA_MARK]), RTA_PAYLOAD(tb[XFRMA_MARK]));
+				RTA_DATA(tb[XFRMA_MARK]), RTA_PAYLOAD(tb[XFRMA_MARK]));
 		if (r < 0) {
 			fprintf(stderr, "%s: XFRMA_MARK failed\n", __func__);
 			exit(1);
-- 
2.56.0

