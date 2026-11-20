Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795152507;
	b=GxyJ8qs/EiDDSUhjHRLmD9iPmStMEVo1XqJI/3jtforFmn+RrsYMFKqUXYtD6kdAGTER
	 WvFUJzhFhdFDNW3rHzZa1f7FFNZzD5bhXt7rFS8erXMHN71E/vEywZUX3ur4Y359jS9qt
	 DmO2AfMRWS24FjxX08I0ayqPNSsZVvQYYP0eLsG9YbzJIlRhci+BOwYw2hNozcw3HMy2H
	 WUE3giB2xXqNrhVRKbNwFb47hBSgM7inc3dhu/11lcispGtz4EmbLE31ow2511FBY2IbC
	 U1vKwCjQ1OkbmDwHlvtEXFqUy/0/KsZd3nu6MUmq7ZsE4zUOxvvH6sECerKPa0ZdfmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795152507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=7ERUV13pYbEG+uwgbT5jjtIsKXtfXcMiUyjhVeq/SAM=;
	b=SW9WkAqVqAlw7bA9spA3zOk841oiSjIlM/pRMKHD3yteoH2JBhpUZkb5Btzy0DpxPG+4
	 kbdMLrSrrR7oJEdcegRAbBxSfrFgPp20bE7a4inNqhmVUgw0dvExedsiPYRz5ZlGo49X8
	 RNtdLh3V3eRyeyAX3XE3/DajxAQClQ1YJ77prFrRjg55J42807Lub9ZdZi1Mp9+RAFTic
	 MM5wrNFGvXSeLoGmd0x0AyL+w62z5o8WuM6tcMrE/QQiN/Oavt10mDKqWy870yxhx+o2C
	 ToLIXmgti/5jJHv5fb+IQCQbrK0Hbej6ctOVnc33qjR9BM4GZZIWzy4WE+I81+tmHdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X8iRVHmQ;
	arc=none smtp.remote-ip=74.125.231.203
Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90FD606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 05:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D90FD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X8iRVHmQ
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-56820670d00so220633b6e.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795152506; x=1795757306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ERUV13pYbEG+uwgbT5jjtIsKXtfXcMiUyjhVeq/SAM=;
        b=X8iRVHmQ3vh0feVZlE75fesBZ5nUtfOxSo777VEKyHWzSLiAdqXdAFnTVgGVHsBKnd
         E+bGLbBYkgSPHlB1Z3LyebdJexG0yYesT+txGagYdD+MCQxr0MU1XBpIlO+sjp6POxLR
         HQQcylpCQh/H3S0m60KBB/qLZjNBfoJsKY9QoLLLp6C3Ku4XvLv8er42CXwdQNx3KFZC
         qiD/86BdjCpXlVF3GKeVHgjH54NdblMNOO0iyW2nw+VOeVsGSLnVyV73Nf+7Yx5MZT44
         knKHxOsmfZC0Zir8OnPrQCY6mwsTkCLI/imwvAXlcOtnZZJAtA4m8tUcU1dv0b7qvADL
         roEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795152506; x=1795757306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ERUV13pYbEG+uwgbT5jjtIsKXtfXcMiUyjhVeq/SAM=;
        b=QE+PGP5pIEROMcSEEA4/CIuPB7NVRE9JdgV6vTVrvaOASzRocL6j0pkNUGxAHrxsBa
         ZwhgURULZku7DcP0kDveDi3Gs2hjqsN7bLTBX/utd1wAj94TRUMTSV5PziIX4aL1WI+O
         meHU2KHCeQpVOjkGjUMd/PNtvfs9pNP7X225esZcrj+sRlFgKM5RwjoWjYIbFD1EzO0N
         MiGCmUx24os9qu9RfTeM2CsqLrx9eU8Fr6WLhHFKIb7kkmvHnmIJRmckdCUUSeNy+F3C
         3VZmaf0buWb0LESA12EDGqSwWUG7bUZ4B8P1fLsRZn4RPxFTCljYMJVimgcBVs2DVrZ0
         Q/JQ==
X-Gm-Message-State: APuU4Z/7mDcRBEpMUmu3GH7EbEzmMFeeq4lYuT6gtUDTUphitWteJGor
	QmPHOqBkCshR8f3YmedNyrdSUA/LMdksXwHWCoT+vibxwynlG5GRinUw
X-Gm-Gg: AYBFou3l9gnReMCx4DbLMec3Dmp9ki3hY85cQwewdn+jmraXSvEVAiykgx3zNyHVRuX
	4Trg8TwCBQ6FHGCb3ITBbl/Jca4losRQPRu5cBd6HRKqVSfQ3c11HaGvg71y6HlsK2hTY8W1nBa
	57SJ5j+w+t4FcabGqFz9IBjT8uaSrBXNom7Xk2UaEJaQl5zf2TOH/NXKqWWKpHqKLfj6exp9gp/
	UuX3GrXlCJYrTiTizILU+kpqPPhYKbQ07FLS0k110XCBpR3q2pP9tJKJmYbPsEuOcTO6bvH4nbX
	7BM/M5oHMvXzvZHmFZiufElInMM+kaqVjcnIz3ynX1+VsymsqB+MtPZJZkXqqAudahwXgTCS93f
	LV77qowbN/Wz0krJWMFn0gvBrV14VnomQFteJ1kW50H7NW7LXyqOvgxDkz8uruvATK8YoJyuUtf
	BtswnKdCrJlE0FZ2m1Ze7Zu/H5hAuTgy6PUrijYDoEBKxxtyu9UzDln2lR1rhRABHk2oa2kGww4
	l8qfAw9Jyo05TtCp0k2SuZjlhMk/B9u1dMED6b1tkWjb1y6nmjxrIzH1Y2tXcqwxWrnS2Z9LQ5p
	u1T4orRNROI2aA4cbfTYMLWWCCxhV+qqJGO3Sus8LngfcWYdiRj/NI0pTI/ou9G5/0jLu7Lzsh7
	yaKI3VscF1qjVsw==
X-Received: by 2002:a05:6808:308b:b0:55c:836:5950 with SMTP id 5614622812f47-57a0a91fc0dmr2909965b6e.27.1795152505746;
        Thu, 19 Nov 2026 21:28:25 -0800 (PST)
Received: from localhost.localdomain ([14.116.239.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm1289912b6e.9.2026.11.19.21.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 21:28:24 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] pfkey: fix kernel stack leak in pfkey_migrate()
Date: Fri, 20 Nov 2026 13:28:14 +0800
Message-ID: <20261120052814.3686573-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

pfkey_migrate() declares struct xfrm_migrate m[XFRM_MAX_DEPTH] on the
stack without initializing it. For AF_INET endpoints
pfkey_sockaddr_extract() writes only the 4-byte a4 member, leaving
the remaining 12 bytes of each xfrm_address_t as stack residue.
xfrm_state_clone_and_setup() then memcpy()s the full 16-byte
new_daddr and new_saddr into the cloned xfrm_state, and a subsequent
XFRM_MSG_GETSA dump copies them back to userspace as-is. Each
migrated SA leaks 24 bytes of kernel stack, which can contain kernel
pointers. The same uninitialized bytes also feed the 16-byte memcmp()
in xfrm_migrate_check(), making duplicate detection unreliable.

Zero-initialize the array, as xfrm_do_migrate() in xfrm_user.c
already does.

This issue was discovered by Tencent CodeBuddy Security.
Cc: stable@vger.kernel.org
Fixes: 08de61beab8a ("[PFKEYV2]: Extension for dynamic update of endpoint address(es)")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 net/key/af_key.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/key/af_key.c b/net/key/af_key.c
index d215b33b7492..6d116862b20d 100644
--- a/net/key/af_key.c
+++ b/net/key/af_key.c
@@ -2571,7 +2571,7 @@ static int pfkey_migrate(struct sock *sk, struct sk_buff *skb,
 	struct sadb_x_policy *pol;
 	struct sadb_x_ipsecrequest *rq;
 	struct xfrm_selector sel;
-	struct xfrm_migrate m[XFRM_MAX_DEPTH];
+	struct xfrm_migrate m[XFRM_MAX_DEPTH] = {};
 	struct xfrm_kmaddress k;
 	struct net *net = sock_net(sk);
 
-- 
2.43.7

