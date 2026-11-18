Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983245;
	b=L068lUtX744Utj7SEbyXY3/pCabnUnNiWLr9CgatLet1lnxS+Rbis8q7bS7vVSF5epC2
	 9vt+gbNWZLjIW389DuCkpjZE1/Yp1F2kh3L9fS/aBCYWrZWnJ4ZKBFYfFvwY4SoCYeDj3
	 7oCJvTd1v5oEECL0q0rHe4gkbyJa8/H/0t2aEowCMnfc9MYSHNoTZ9fDj9QiUO3e0kHPc
	 St7Jt3gKQpc0dSGT+H6Mp5jL1ev6H+Mb29/EmG5wB0ngrn9NLFvFbkbJaN6En3sY5+CqX
	 g+rmN4/hfLpHtxA7sZhIwtzWOsnD4L8U7qFlv3qR+JpIjxAk51Cd4zXKVtyjtiFOhyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7z2zaD9FhGQE52XLgJ6ugKxfSiH1puWP6hppmumNUXE=;
	b=Jm6/H6Gck606Atdg5yi7byCbGaDI51dACup1j4KoNMX9/PxeHMhVhyCMH/0HIvBwZQ+U
	 vnrxjPKOU+PJS7C4Q+UjApffJFrYP9o9NK0CH+rg/JMlXTLlDXLcLku5NkIf119flNVPR
	 x72JZ5KI9ayJIm77upEH/j+jc2EbAxnIKlXq34HlIKLrdypl/7xOxYDAT8Qyae0U+snGo
	 DsTG7+QOuCS/PsgoSmpBX2/ISqPjCjpLTvT36UXgWmW+WGVP2vLE7z6+3UAP3GgdSepWx
	 lH6jd0UG2+EG7eY6C9PdjlBR5ZOU3jsjwz6mcDDvtJ/UM1aIZMxwviOoIFx01hakyxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x7IwsRBo;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF93606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEF93606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x7IwsRBo
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1ae58d17cd9so581354c88.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794983244; x=1795588044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7z2zaD9FhGQE52XLgJ6ugKxfSiH1puWP6hppmumNUXE=;
        b=x7IwsRBoydcdMDD+Flq5s/JnPlKTEaTAsAn2nfIjGaw9MBXsSkA2Nfw1JPuT/ZsYiO
         HFnNJEA/pLadXhW1Es4LkjsSrJk5cCs6GzQANCXo9CK0HEkNqwyA79/NvxV2VT1qN5wp
         ykphWF/0eZ+abm4urq7bmJ5tU3rsxPO0CwuSGB6CCcg0u09knvlleABa3/THBgY8JxSS
         k2yECAxi+hhOeO3KlJ/e2Y8XcfRLPLHadbCyN6f/pSkmNQU1Cs9yOgAA0h4mih9uOzBZ
         alWCisxdNxSdOk1hpRZvy0cA7ejdlDqC4Y++CwLE9zby1T9bxWTadwbAH7oyzSQNKuwW
         4rPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983244; x=1795588044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7z2zaD9FhGQE52XLgJ6ugKxfSiH1puWP6hppmumNUXE=;
        b=owPsnkUbgH5s/SY7qItb8ZgQo36uxQusy0kJrQGTwQDWhV93WMU2gw2OTmWKGTrnMN
         c3Du1y6NO1FlZ1aM52xkuNfY1jlwyhERD4buUA8B5tIArCUQpZgLQLodLl0IcknpzWe5
         NjyJU8VoS+AuUwKSZeqyinCFvk5ZPT92bPFm8jEHc55utIeTTlZEjs+8FS++lZvrUP10
         n4tKttzl9Y+EXngeQ6iy4jbOqRTpm0fEiYORjsW8xqS1gIlFLF8yDmArCfbm36kvbmdL
         Kau17g3gW3VWrxBLOS+IIwB3Kz053KBcxwVgoE8FvVbUKD/8ygtBOG13Zk7paoZD4pYs
         Bqmw==
X-Forwarded-Encrypted: i=1; AL+hErHz6RjgLAAhLHgRS7naN6VA69HlxI6TdML3g3LbqMO3gdnC93L97QGB5t1N8qruiiEDdgvXoqw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uqRCFyk1HvnCRjLpNKixwD93VhF1rnig0GnFbLpim7OiUOY87
	ER51FIXVfXWJxHFqBF2p46NxyTbx8C3ANvwNd9sq26qocyVcNbU4VZGF
X-Gm-Gg: AYBFou1xbkv5CkYkZKroUu7iqkiTkMpQRqNMs4PWgf6e01YmLTUqX4jlOvQsGj6L8++
	XBlWDgJ90Q8oOypf+s2v6OfcyYRkeuDNo96GucCoNPUwyPEUzFOY9QoLCtEstrGHKM4+iZqBFmF
	ooK+nVBhC/u9HfEeWso4DlxaOziFANOsuKyYL5SmrAB4uo81fb+Wos6rhdUY49MPlWhQ74nYaZS
	LuUsD70CFnER2bbtLUkJH5lrrIt0b3asL/gQnDRxHfv5uyrM/Gj7BAKeOj/MrOnK7yXPYqCm8VQ
	+n4CUlRx+Le7/tAIIFNS3Of5uOhFbfuAHFc1OsSOi2MHfiNs8XCH46a6ZHLlTmpmmI1ZiNp5ZV4
	WzlZDxHRRhYRKTGMideyunMqsQPna+e26cWgfqqh8jIpwrIZjU4MZWxvakt824RyewSrSth/Oq2
	Gk4R3d+I5+q5Da2FfhP3DPszaX8Fxh9nFp8MZ/8fikb2tDsKkRIDsd3EOXcQnjr1SZeg/kJ8fCi
	PEa1dXj3wsjaT1GF1/PFNNXmgP90vfihidPhEUTK76ys2cs/WDpPMVCNRY/kgzadFaHxs8Rqjqa
	hXH6wi4GVmXPK6wXPHumMR6sLSBlMQ28M4kr26I=
X-Received: by 2002:a05:7022:b88a:b0:1ab:faad:cba with SMTP id a92af1059eb24-1b543d06698mr1557626c88.34.1794983243728;
        Tue, 17 Nov 2026 22:27:23 -0800 (PST)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4eafsm3608663c88.14.2026.11.17.22.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:27:23 -0800 (PST)
From: Zhengchuan Liang <zcliangcn@gmail.com>
To: "David S . Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhengchuan Liang <zcliangcn@gmail.com>
Subject: [PATCH net-next v2] net: avoid hashing the namespace pointer for device names
Date: Tue, 17 Nov 2026 22:26:52 -0800
Message-Id: <c9b3c1a0e3410ffa70db448e2299ed420528b5ff.1794981913.git.zcliangcn@gmail.com>
X-Mailer: git-send-email 2.25.1
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

dev_name_hash() salts device-name hashes with the network namespace
pointer. An unprivileged user can time SIOCGIFINDEX lookups for chosen
missing names and identify collisions with a resident name such as "lo".
Ranking this collision pattern across possible KASLR slides recovers the
init_net pointer and thus the kernel text base.

Use an unsalted name hash. Each network namespace has a separate hash
table, so this does not change lookup or namespace-isolation semantics.

Found by AI-assisted code review and reproduced unprivileged on an
unmodified kernel without fault injection. The reproducer and networking
selftests pass with this change.

Fixes: 8387ff2577eb ("vfs: make the string hashes salt the hash")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Zhengchuan Liang <zcliangcn@gmail.com>
---
Changes in v2:
- Pass NULL instead of net_hash_mix(), which would expose a seed shared
  by other per-network namespace hash tables.
- Target net-next, as requested by Eric.

v1: https://lore.kernel.org/all/62774f8c6cbad549d1a95f88df99ab7745d7f6b8.1790917676.git.zcliangcn@gmail.com/

 net/core/dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index d88af07aea29..12100fbf9022 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -195,7 +195,7 @@ static inline void dev_base_seq_inc(struct net *net)
 
 static inline struct hlist_head *dev_name_hash(struct net *net, const char *name)
 {
-	unsigned int hash = full_name_hash(net, name, strnlen(name, IFNAMSIZ));
+	unsigned int hash = full_name_hash(NULL, name, strnlen(name, IFNAMSIZ));
 
 	return &net->dev_name_head[hash_32(hash, NETDEV_HASHBITS)];
 }
-- 
2.34.1

