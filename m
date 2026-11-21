Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296260;
	b=0j1/EPVhViZPx0S96S9ByOeGdwaeWsUBpbPe+ZPhZ6XP0W8WEhNNhzCSXd9vYOiJtjpk
	 NgHO/Cvds0sx744o3hqlIzPOb2gXPHRNhixIoFMlpAeZlifn360RlCyzM0+YUGV0isGsB
	 n93KVEBqRLVuCuLcZnd2qjXo+dq+jexfGNTz3ApuLu3dThbYFCiUjwomeR0ZvFUf1waz2
	 e7tGAd/G85JII3BVzq2pABPc12lDATMNSTqVEh3vu2zGPRUJSPnqn0oBoPWz+P5tqOVy+
	 gCqQQNmhrktCIXqNmfE/KKCjcv/CW71mdNae/qCfzOgxqLK1wtVmPhFvuHs7WTZQvzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=QnN9CxDyovVg8bGKbDx5lj1s9US1BmNCEq5WllIH360=;
	b=m1Z2HSy9nG1eP9Sc1b/w871/JhLaU9mMWnjHcOwN/ejVGPoKAB3RpjNBQu7XeTr5+1Eh
	 EPZK+HDswaiFkBhr7Oi60ql76MbD1CnSGgwqB+wQlqw/FNquy2X0gr2w6cLdrkwWPrECo
	 oLkKNfMTfbZTXG3tJTBMRwPWp1Y39KdJrM9FCI76mqvT3JDvMz1hp3NJuifrB8v3M84Sn
	 nVMTGcCxUojAYQJQMuXskv6qIcVVTi9JyUzwX13TXdetOeYG0D5UIG/eXYWT6NwYKFflI
	 vgCRBV/uhuy28bcjsB+3xjP/w0WReg7B/AMA7Y3NCsq+KlzQjTMPbb+mfZCZJJaTxFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YW2xYQ6p;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2D0606A32A
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 21:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A2D0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YW2xYQ6p
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so21835095e9.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 13:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795296258; x=1795901058; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QnN9CxDyovVg8bGKbDx5lj1s9US1BmNCEq5WllIH360=;
        b=YW2xYQ6p5a+/qxuh6gQeHzVZ3q+n02Ssc0O6m0bU+KNH5dQ6q3GV5o3oloT+NNbWA5
         u9OZgm54775PMXQDC8bpf/J8uQDss7hnYA+QUxDR0JGdmoilqw5laNHTEN2N6UhpV7ge
         Q/AG/VmHISqJFZm4JTQ0lmpnoQdpyXk2hp/nbQ8TyXol1P2k+U6CQZlqi2UlcNjUpHCD
         nHpFKkki+pVOJvNQtcB9sTywJQNK9UcaoIC1wKqVZkrqk8oHvqVbI0Hf7hz1bGYrWVpn
         kFQ+yhL2+RrO+AtSSHWxjyjRRDmbAUlzNN+bdxdp9tjiG1IjtWTYsyo7IPLGVZEiHF3S
         q1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296258; x=1795901058;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QnN9CxDyovVg8bGKbDx5lj1s9US1BmNCEq5WllIH360=;
        b=tLXsXtJ5GDf+cSjgPnCzP5IF7jWswTvaCR0Fv2v1KLGT1fsMkb1AwJs0hc/PvT5J4E
         jLMQ6YdfHOYznPOvH+hDJxC2QBPd9itK6T/DgtWT6ZIjDJWcxEveveErFXl+pyuEziuD
         mTIEY2cJ4ZdrPAFaEwzGpezkpDbb9BWl/ASUHh4VKN27AyiGbHPeVovB9SVelkZaBnjV
         MVdotMPHNQJ8c4aTD/IwlNgyY10HH4Dm92arn8WGKRaDA92mp+dEHzmiFMbfAFVN15J2
         J7YHse/4efL+Ytzj0k7hS1/iUzrGhRPrLqgqxXqKrIJNB49t4Ce01wKH5ISKthSBBeJS
         7RtQ==
X-Forwarded-Encrypted: i=1; AL+hErGKk2+Jz9Nj8/OppdNnrrm4cHSY44PF/KYZ7XBG+lYYQ5rLA50RQes+Cmf70pXwOKYSdE2tXZo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NahD+b4dsfE9R0PwPV/oGIYShgMDi0e65dHDrLLFdPk48N9Cw
	zySprbbBJqkvcT1eqesTiI6TCtlrdvp2vYPTgRmlCHs02TOI+Ut56MAS
X-Gm-Gg: AZFdTZf7aPspD6H038sN6YjfNLe8aXie5rDgrNb2Xahx+GZ6XPGISmDru3vjwymwcBV
	ESQM2Suxw8K/wgtyZg/yUUnZUlpM6K/eucRk6ZMGyhoagpGC+ileQYQkqxjkjYW2FlpnpkZTBSH
	7/e7bIxwQrE31F6TE8nN1bgm3H9smIV7VdODFLv2JirrRw5lo2vSVlwbd11B6T3wUBhocPOP2g+
	r4gMgPbYNKvj9qVXKrbhnxM1v1aqp9qcgd9IBooF1p0xamu1eFwBkBCk1VJERoOArE9QZmHY0fG
	ly42gjoFg/giwTYlbNf7ApcWNDvAIyIdq9NXBZo51G8ePA3fvbN65hxhT09OFAv07c79jFwMtkE
	RbfBtyiB0QWwOa7Jxv2qrT2ayUgo9enjXkIVExx3mZWeBz891fVIglqWI2hwkk8VHrpS/taaogh
	An4R2EGotrW4ExRXrVgkXG0oteHeS9eWMJ27QKXZWCvFLF8yeboDK69UprLoJs3GNjrttjE0X1D
	hfR/COKQElkEdE15/h87M9wpq3ETv/UNKLRdzVfEHXfITn9PQPWlLIpifWoDa2Bym3fDW5cLr/o
	g2FP084cbdDouQnwemE4rqfwsQ==
X-Received: by 2002:a05:600c:4f15:b0:4bb:6861:657d with SMTP id 5b1f17b1804b1-4bb88923954mr173957455e9.21.1795296257761;
        Sat, 21 Nov 2026 13:24:17 -0800 (PST)
Received: from metepc ([46.197.185.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb905f1489sm79231845e9.0.2026.11.21.13.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:24:17 -0800 (PST)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: pablo@netfilter.org,
	fw@strlen.de
Cc: phil@nwl.cc,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kadlec@netfilter.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH nf] netfilter: ipset: fix extension leak during hash resize
Date: Sun, 22 Nov 2026 00:15:27 +0300
Message-ID: <20261121212037.149722-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

During hash table resizing, mtype_resize() skips expired elements
without freeing their extensions. The old table is then destroyed
with ext_destroy=false, so these extensions are never freed.

Fix this by calling ip_set_ext_destroy() on expired elements in the
resize copy loop. The cleanup is done under the region lock with the
bucket re-read into a separate variable to avoid races with
mtype_add() concurrently reusing or reallocating the bucket, while
preserving the original bucket pointer for subsequent loop iterations.

Discovered by Sashiko, not triggered, not runtime tested.

Fixes: 80571a9ea4ca ("netfilter: ipset: Fix hash resizing with comments")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
 net/netfilter/ipset/ip_set_hash_gen.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/net/netfilter/ipset/ip_set_hash_gen.h b/net/netfilter/ipset/ip_set_hash_gen.h
index 80ca523f304b..47aab02c9d23 100644
--- a/net/netfilter/ipset/ip_set_hash_gen.h
+++ b/net/netfilter/ipset/ip_set_hash_gen.h
@@ -823,8 +823,19 @@ mtype_resize(struct ip_set *set, bool retried)
 				if (!test_bit_acquire(j, n->used))
 					continue;
 				data = ahash_data(n, j, dsize);
-				if (SET_ELEM_EXPIRED(set, data))
+				if (SET_ELEM_EXPIRED(set, data)) {
+					struct hbucket *cur;
+
+					spin_lock_bh(&orig->hregion[r].lock);
+					cur = __ipset_dereference(hbucket(orig, i));
+					if (cur && test_bit(j, cur->used)) {
+						data = ahash_data(cur, j, dsize);
+						if (SET_ELEM_EXPIRED(set, data))
+							ip_set_ext_destroy(set, data);
+					}
+					spin_unlock_bh(&orig->hregion[r].lock);
 					continue;
+				}
 #ifdef IP_SET_HASH_WITH_NETS
 				/* We have readers running parallel with us,
 				 * so the live data cannot be modified.
-- 
2.56.0

