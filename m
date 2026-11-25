Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572295;
	b=Gq2vOj7CFn7diGbGs1e6XWhA1LKdvdZ825La0yt9bLyKUJnudq7rjGQMImCgVbEJ62EL
	 YBzWHiyKQWvCzB9YvRTPKMsflR4z+mMzerS0wauBMsRGLUn2ssKemzZt9Wi4yhliECG4O
	 RyoqGDoVmr4VttXwpuogU9DqsnIgg/oq+sOAtadC0GpH9bqrt5hCM4d0tRigz7u/SN1tM
	 aPSZhBG4EozqRf5FFK/X+Od8nJ2nhHQHKTJ0guoCbdQDzTLlXrNHBvW3p6e/Yq5RXPzSB
	 TrKP3Xvzwz/8yFiY7BDDLszSZSXNK72oSVPIRv25FOE1o2T9vDdKT99dtIylmnNJMbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f5TEOsSlpu3MCVl743p8hlRAuGk8f5e8Zz385+1IMm4=;
	b=yRJnp+9syMjJyAmRFdRTtxpIH6TNqICywHwa0k5NJEoHwx3QS/DVAUr+9KHkN4y9OcZv
	 MB1FUYw8UHNfhtaFXVozmYd6zV04SzrCTu2/BP5ICki+B6qN0HDpU4M7JRpDRy60xxWEa
	 GcbcHNWFvNuOqkQ9TuCUFoWK2+NPvyHNKZ+xgbAxMKmZQZp+dL7QhvaNZ5jS8X6YFNr8H
	 RuH5asR44jUM73ucx2zbClPZu6LwPVKu3lSXok0rO3GqrEO2Kztc7KfpnnDxINThmq934
	 Z3GEVOmYfgmsyrI7U/bHPiahy0cmkfJro6wQaqhQ/BTD+dS+Ia/RyvfsPiCjrBaklyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OujSzYU8;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BC4606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 02:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23BC4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OujSzYU8
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f046b0adc0so28545215ad.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795572294; x=1796177094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f5TEOsSlpu3MCVl743p8hlRAuGk8f5e8Zz385+1IMm4=;
        b=OujSzYU8ZqBCZBdGtmxlxflIFQHkmB3wKsr5lC/zXSjpuwndrApIjDbDWXasaTv8rp
         aKO+kI4cY/XWfFnZck4G/aF02T0rWLxnhD3/YVJmHGcJBXQ7FCzn8WbeX5RwfGZPk7jb
         fCQEvJOVFnQETHRdnFOeNjmHJf1e34tgH2LvpMvS6Qmd70QDxduK+LILxa+eDaZQ0PJx
         QKY7ssNbv8McNVZG3EgfEhs+pZhAFtS0B5OfeN/5JleJ8Df9xZXmyAHkvAevYvk3WYEC
         HkWis7Mr+L5iohnSWr03nbOjz+QZ+euLjt070dC4BJ25WlwtPxcqezYIFWso0qRC8Gip
         8iEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795572294; x=1796177094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f5TEOsSlpu3MCVl743p8hlRAuGk8f5e8Zz385+1IMm4=;
        b=qFtWm7cA5KRuDdAnxfpkFT5kk+RgrOXl5Sj0t6I/ZnBbW85m9KF79WBUoG+cMy7uU+
         OxUNRGr4QgYNGxwelOElIDHvUTcJR7fUQUxnPjrBTOOz0bTfIdU3+HUoIDD/6OHJgygm
         D/2RMqgBj/j5hPM7CUCnofGw+uQZZtUCrlXwiF1ACbaPMaAOhpBif2EsVx35vRIZikmG
         fv9QZpZvSkBRw4JePehF8hAP3R+Q98isrUmx9/IdIIQZHhko/amHI0LWV6V5B3oLEPaG
         N2KZybFu4IKNuWGkugrWA6jZVog435NiSFqmLehMEoK1nMZTYN50Y3ai81tu14lwo1rT
         lQ1w==
X-Forwarded-Encrypted: i=1; AL+hErFcrLmjML2fGUBJH4/bL50J4xnU02CddKxCrkVALqIlGm/fxZ98dtiPe66NRR60Dinquwl2ako=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2pjPiREXE/dgUlWSkMDLPYN7H56xgZXmAm5Z9b8jGL7kextv2
	7v94xx0HBzlpEQJq1wJ0wLbsBjSGoPTqksmPrgB+VlG12gZhVGxsOwhrnfuzaZq4
X-Gm-Gg: AZFdTZfuOT3wNpInQCE49WUTWF5nkDi787FW6Gr5FaxTkHcfT3+/tpzXDLv3NY2W+75
	3hZ4ycUGcABsOmilaIifaYMeRYp2PMIVOj1+YGkVLaegY0sQMpfqqTAW+ePEu86r6MMiEtyN/FI
	6zCKcOdozR/y++0BBwVxnb6+h+mGkf+VDm3fwa1Raj0ohcmJfYs24aRkrYR3yO1bO3j1SQm3FqM
	YveXEh5XdQUf9qzu3ItkRENnMTA50Ia98w7PTl0WQ8NKjEfurBRaA+TmlpD3qMVAfKjoo9olXfm
	gniUHrxrFw60+EttEu4tOkb6v4LMHK2SyCqzXOXwp5rGe794dmLIOWgRCeBusPS/VGqXi6N/JXJ
	9JFuppin1aKQn/zmtcpOqk2o1YQmtJiM5jCGP8sHxpBPzkSl4nHSVY9pTom2NBWck7/C/ytv5MC
	lvcgqxkTiLX1EshPWHvTjvXnS1qfdOcmzsz/+O6lqMXB1+rM+JJK9N+M3JWBTBN7Rgd3ESEKPV/
	xYdJBFEivoct/KQhAF16wbBkIMkZNoM46YS5vxfrxUrD/ZuXhFyvPWpM1qy68qeW+g28dRV0dBM
	zMjDYyfXy6HsXrojL6KaIALGtHzA3p5wR5nA2GkLDo8vr74uvIJO5c2O50wp4Rom6u0=
X-Received: by 2002:a17:902:e811:b0:2ed:3f47:96a3 with SMTP id d9443c01a7336-2f03f169628mr159139275ad.42.1795572294458;
        Tue, 24 Nov 2026 18:04:54 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120769sm77161585ad.57.2026.11.24.18.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:04:54 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Jon Maloy <jmaloy@redhat.com>,
	Tung Quang Nguyen <tung.quang.nguyen@est.tech>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Ying Xue <ying.xue@windriver.com>,
	netdev@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net
Subject: [PATCH net] tipc: check the monitor record length before reading it
Date: Wed, 25 Nov 2026 11:04:50 +0900
Message-ID: <179553307368.1670514.4694378910047786259@gmail.com>
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

tipc_mon_rcv() reads member_cnt, gen, ack_gen and len from the domain
record before it checks that dlen covers the record header. A node
whose monitor is not active sends its STATE messages without a record
(tipc_mon_prep() leaves dlen at 0), which is the normal case in a
cluster below the monitoring threshold, so the receiver reads these
fields past the end of every such message:

  BUG: KMSAN: uninit-value in tipc_mon_rcv (net/tipc/monitor.c:499)
   tipc_mon_rcv (net/tipc/monitor.c:499)
   tipc_link_proto_rcv (net/tipc/link.c:2301)
   tipc_link_rcv (net/tipc/link.c:1773)
   tipc_rcv (net/tipc/node.c:2174)
   tipc_udp_recv (net/tipc/udp_media.c:389)
   udp_queue_rcv_one_skb (net/ipv4/udp.c:2433)
  Uninit was created at:
   __alloc_skb (net/core/skbuff.c:716)
   tipc_msg_create (net/tipc/msg.c:104)
   tipc_link_build_proto_msg (net/tipc/link.c:1857)
   tipc_link_proto_rcv (net/tipc/link.c:2311)

Read the fields only after the dlen check.

Fixes: 35c55c9877f8 ("tipc: add neighbor monitoring framework")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
The issue was found by an LLM-guided test generator that we are
developing as a research prototype. Any link between two nodes below
the monitoring threshold shows it, for example, as any user:

unshare -Urn sh -e <<'END'
unshare -n sleep 30 &
sleep 1
ip link add v0 type veth peer name v1 netns $!
ip addr add 10.0.0.1/24 dev v0
ip link set v0 up
nsenter -t $! -n ip addr add 10.0.0.2/24 dev v1
nsenter -t $! -n ip link set v1 up
tipc bearer enable media udp name b localip 10.0.0.1 remoteip 10.0.0.2
nsenter -t $! -n tipc bearer enable media udp name b localip 10.0.0.2 remoteip 10.0.0.1
sleep 5
tipc link list
END

Without the patch, KMSAN reports the uninit-value above as soon as the
link exchanges STATE messages; with it, it does not, and the link comes
up as before.

The patch was written with LLM assistance; we reviewed and tested it.

 net/tipc/monitor.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/net/tipc/monitor.c b/net/tipc/monitor.c
index 0164a034b57e..9a8b3e5010c1 100644
--- a/net/tipc/monitor.c
+++ b/net/tipc/monitor.c
@@ -485,21 +485,22 @@ void tipc_mon_rcv(struct net *net, void *data, u16 dlen, u32 addr,
 	struct tipc_mon_domain dom_bef;
 	struct tipc_mon_domain *dom;
 	struct tipc_peer *peer;
-	u16 new_member_cnt = mon_le16_to_cpu(arrv_dom->member_cnt);
-	int new_dlen = dom_rec_len(arrv_dom, new_member_cnt);
-	u16 new_gen = mon_le16_to_cpu(arrv_dom->gen);
-	u16 acked_gen = mon_le16_to_cpu(arrv_dom->ack_gen);
-	u16 arrv_dlen = mon_le16_to_cpu(arrv_dom->len);
+	u16 new_member_cnt, new_gen, acked_gen, arrv_dlen;
 	bool probing = state->probing;
-	int i, applied_bef;
+	int i, applied_bef, new_dlen;
 
 	state->probing = false;
 
 	/* Sanity check received domain record */
-	if (new_member_cnt > MAX_MON_DOMAIN)
-		return;
 	if (dlen < dom_rec_len(arrv_dom, 0))
 		return;
+	new_member_cnt = mon_le16_to_cpu(arrv_dom->member_cnt);
+	new_dlen = dom_rec_len(arrv_dom, new_member_cnt);
+	new_gen = mon_le16_to_cpu(arrv_dom->gen);
+	acked_gen = mon_le16_to_cpu(arrv_dom->ack_gen);
+	arrv_dlen = mon_le16_to_cpu(arrv_dom->len);
+	if (new_member_cnt > MAX_MON_DOMAIN)
+		return;
 	if (dlen != dom_rec_len(arrv_dom, new_member_cnt))
 		return;
 	if (dlen < new_dlen || arrv_dlen != new_dlen)
-- 
2.43.0

