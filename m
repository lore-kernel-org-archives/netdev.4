Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913587;
	b=jTpjLo5W9P7JbF6i1QvMw7dgyfd6j8O4g/jx06wQvM1ZOM8wsPTXVZqbln+Eb5NsYBdK
	 iU1CgHS0vKcqLWbg7O4QlGlvRa7wKCvzEzwl3uP5y71gmjnK0Er/Hk32tvt0a4BM7WAhO
	 ZizbpD4ntAPSpzHCegNUKts+8cVuYpSrzGqgJvsd8YQN5aLZcaT+7OgRZbPKZ1SaZXeP6
	 JkmWfw2D6xINB6BfvzH7T5tgkFiGB96ejkibVbOQGV3zTR/vajsVvSUU1bFYogHmGTN9o
	 4eO9d1GM+aWsDpqZasFV29cjqbCGQjcJXmBuI+GCoPqnj4slKfoaAcZRiosRMKPHbpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EvItfJHxd8c5dTklJAZwYq0woDsuW876EaS8CC1xRLY=;
	b=YBTSDMH7FfGeec5gsfdogzBNpfjr6kycponrZx46HDmSfdug48d4Rs2ezEuVzsUweSnK
	 bb9LY6CV2vhwiCqg3ZZYE+XiEjfzK4IUxm3QbdT5ALV0Bp6564KdyZyXmGKN9cYC2ivH+
	 WQgmkhXlxArQ2PpK+eY+fbaovtyvNuUOWSGrD76cj8LvaAUwhAGC353SuCfR2eJCw5sfS
	 3cXXsIXVzyzfnryXtl0H1/p3ZP08qAFtsjCfBFG5sHL4OaPj/SnrrAyvqURKd838rxN0q
	 c3qGss7WlYTh9+EskedV4KLdpKtaqpnOIFv51qGtYk3pPBtvTqALVct0PHg5v+eaCGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GTtYMygC;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F724606A336
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 11:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F724606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GTtYMygC
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso3584995a91.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 03:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913586; x=1795518386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EvItfJHxd8c5dTklJAZwYq0woDsuW876EaS8CC1xRLY=;
        b=GTtYMygCZEplb7cOyOjnmErSi+ti+NxCiu9NyR92mBZE0QqYvw9Ed1AMazj8lLlccp
         J1FnTTSvbyQKvJZoTpzmxUQGUpNwFQcCYmkRh4MmP/YwrHwpwjghLxV0HcmzgvbUmdkb
         Uf98ItmaElvdNp+vMIgBvXUfE7+CgJbtE0yz7fmi9jk2wvBT4lELEsP6Mlt8+b7Nn7VC
         P55wLonSgHUoY0c1LX2lziWtwtIcNlGcP3ZVDURQZZYioAQhdvsYFgEWPMKPhzz7k/Rs
         /eYCuK90hpuxuMZFqszcNR1To/cx3OOSjSnCqkrCwR66jCSxISd1nJXHiUUalY3ZGAa1
         ZzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913586; x=1795518386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EvItfJHxd8c5dTklJAZwYq0woDsuW876EaS8CC1xRLY=;
        b=vtAJH1f/mQvgNaEerOHcHFoYhEmXFPmNW/k5M7Al/7SXdW6130uE5hwv5nxG4RlViV
         Nv/AfJWpVDXSCc9vkyR5kzFb/OUkZYF7OYJSelmSVOL8ZlSiOPdJjgO+uMnHScv3Oyjp
         axZM+bPNdA4285t9q3U/XMq/1vLmVP/V1ceQK5l/ogkCXr/bxNpBsUdD+bU1LamWTIo6
         XJ5iyuFsGkJq+kGlR7+BOS78b6hQhub1nqmawdbiTEeHlZY2+WK0UigFUuJwIsVNgLRB
         H4Hp6/kGVRdsaHKtDSCNUpxv3HVN04XyAjX6kwmk9Gj+4Cg2JbBllOzrIuBzWl8u+hsM
         F0cA==
X-Forwarded-Encrypted: i=1; AL+hErFQSyzH8NsRZ5TiX1Xkyb7cwgxp3EVrtpa9EFSFsQeqapJafWAs7A/XhCJSPi0bS070xk1Yqns=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zvDg0FNQHMD9TmgnxBZM0gk2kXGVfU0GjLAPVZH6tR1wjal4G
	p8qgC6id9tdKNBMnR2cNB04tDqTZUee2eCUzjs7VGqPj78CwQyYgpVKY
X-Gm-Gg: AZFdTZcOIfj0KVwBWDai/Hs//xZz4J/3MakQY1m5MeRQ8iz5tC/FEzqSwksJVflEKzZ
	yhLNyv5CBly1owjS3D4RbdptD3lLepgLjwMAXqpr7PR7s3Dx3wXgKy6P6H7Jpa8TX9YT4o+4IZT
	VqA8PRTUD7jFWkyQK+OkF7fbI1I5+hzZvFhgB6WVMemM68MnE4zNpzhtfpoQoujJXDdUOAzY/iv
	gtiFtKCDHgPhFDQ4pnWEJCRI5Tz4na5lqbJOUPCjeEQ0Q1mssvmahB1no29cR4rSnWwCRD6mM6+
	M+nQhGudZcw69GVnLSOVM1Xs+CZM08GCCLviyaSthYzyS7S3AbwAUfkL92aUHgzk01x9JRYq7bj
	JK63ToVstjbp83MnAaHdzxef5Jou+Gy+E6du6f8LkX9N50zRh8EA9DE2E1n0gp+ysx4VlmjR+Cp
	gMhLB1lFvelGzgm8ok8tcamGd2NozONF488oApgvqrNpfTcifLr177aO47plVz2tRIzmtE+USkg
	ASN8XlxJaTdRbWmfECynMkfELDQAdtpHbCXnMpisYFXgLZMqfRuSZpR9F5MuQH0Bdv0Fiwy9c5B
	rZHeKiMKXqkSthFxoK25aDKTT9qk44t50Ztdu0FWSnH3rOJl3whzNV3nre//o6GuZILOOmLy6Mr
	dicGee7F6Guwu2w==
X-Received: by 2002:a17:90b:5347:b0:39e:6a80:b799 with SMTP id 98e67ed59e1d1-3b1b0a3ba60mr15136679a91.41.1794913585863;
        Tue, 17 Nov 2026 03:06:25 -0800 (PST)
Received: from JUNVYYANG-MC1.tencent.com ([43.132.141.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b1e9ef15sm11674475a91.0.2026.11.17.03.06.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 03:06:25 -0800 (PST)
From: Jun Yang <juny24602@gmail.com>
To: pablo@netfilter.org,
	fw@strlen.de
Cc: phil@nwl.cc,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kadlec@netfilter.org,
	echaudro@redhat.com,
	aconole@redhat.com,
	david.lee@trailofbits.com,
	manizada@pm.me,
	yifanwucs@gmail.com,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	junvyyang@tencent.com,
	corvus@tencent.com,
	stable@kernel.org
Subject: [PATCH net] netfilter: ipset: skip inline gc during hash resize
Date: Tue, 17 Nov 2026 19:06:11 +0800
Message-ID: <20261117110619.46590-1-juny24602@gmail.com>
X-Mailer: git-send-email 2.54.0
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

From: Jun Yang <junvyyang@tencent.com>

When the xtables SET target adds an element to a full hash region,
mtype_add() runs garbage collection on that region. If mtype_resize()
has already copied a live element, both tables point to the same
comment. If the element then expires, inline GC can free the comment
in the old table. Destroying the set frees it again in the new table.

Take h->gc.lock and check t->resizing before running inline GC, as
the periodic GC worker does. Resize sets the flag under the same lock
before it starts copying elements.

Fixes: cffcf57bf03c ("netfilter: ipset: exclude gc when resize is in progress")
Cc: stable@kernel.org
Reported-by: TencentOS Corvus AI <corvus@tencent.com>
Signed-off-by: Jun Yang <junvyyang@tencent.com>
---
A KASAN reproducer for this issue is available if requested.

 net/netfilter/ipset/ip_set_hash_gen.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/netfilter/ipset/ip_set_hash_gen.h b/net/netfilter/ipset/ip_set_hash_gen.h
index 80ca523f304bb..70f768ba7b443 100644
--- a/net/netfilter/ipset/ip_set_hash_gen.h
+++ b/net/netfilter/ipset/ip_set_hash_gen.h
@@ -1009,8 +1009,12 @@ mtype_add(struct ip_set *set, void *value, const struct ip_set_ext *ext,
 	maxelem = t->maxelem;
 	if (elements >= maxelem) {
 		u32 e;
-		if (SET_WITH_TIMEOUT(set))
-			mtype_gc_do(set, h, t, r);
+		if (SET_WITH_TIMEOUT(set)) {
+			spin_lock_bh(&h->gc.lock);
+			if (!t->resizing)
+				mtype_gc_do(set, h, t, r);
+			spin_unlock_bh(&h->gc.lock);
+		}
 		maxelem = h->maxelem;
 		elements = 0;
 		for (e = 0; e < ahash_numof_locks(t->htable_bits); e++)
-- 
2.54.0 (Apple Git-157)

