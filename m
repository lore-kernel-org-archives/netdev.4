Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187222;
	b=gITQmWqoGq1eiW1Ff8Wq/068uyCiuZQCtDUOFx95HudylbtOiU5RPMlpyqnBAk31POid
	 ED8Jfg/dkOs05DqqBz272odPSUV6m/HzM6xS4hAr4FjQKWmHAgTNgDi0eS106/SVCTAgv
	 7tSz9Ip6iqkzALnai5p7+ixlXruznrqlCs/YRga8e6qsy5VIJVjzCzuTMeHGWyXwFvoRM
	 Uz8oKRQl5sAkiVo9kDgaomTi0IFamsUmpXLKghQKHtNWF0s2aMICeneXguFs1CbLRJvh+
	 bNVGCArHQdhWxNEKMG+dkCrJlDUqRTIJi7lXvUiOuY4aaxOGXG4eDZKDbOFva6RW1hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9CwbjPZ+Sgw1ndd0ojkmOYPv2IF6fDVO7S7jEJJhl8w=;
	b=fk6lzUq0lQYuyI5iK0W2oA8mRvQDyUIni6UoaWZ4mMwpeJyAeDsqKxaHf7H0vGPHWhFt
	 kEbequFVX4aH6xXmozYwnEqG6io+RagqHRBpo0La0sqyeXiR44kK21wpOu9w0C+vyPNzW
	 tX8FeLyyq74NAP1svHTEVlw5g3YFqTtrjCkmUk5nfrgan2Hx21H4kr7TLYR7i6DCBfnqu
	 7isoh9Z83ZGYnwEDowuwvVeTTwEy04lLac5xIq4TROmB5ApGA/HZH2OYOieBDZS61F+jB
	 Lqo0LTaEZkvtsG72V+jKt2eiIsG6WHUJ/OGRfJEzfsvTlt8Q2x1O7qqfxJn2LniW0sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0bQoCqu7;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05F1606A32A
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 15:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A05F1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0bQoCqu7
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso1315079c88.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 07:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795187221; x=1795792021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9CwbjPZ+Sgw1ndd0ojkmOYPv2IF6fDVO7S7jEJJhl8w=;
        b=0bQoCqu7q7T4VRJfEcl6DHmTQUZfcAErx4Mut4fCBZtHuMa7mEvzTvUqd7GshdjA9p
         YXPVJ3LD/on+QupQJxU76ZwNSyckAKmqJMB02KDUkmL3kQUYbKw5uKbzBputxAbXSD2a
         UXcBe//Tj1Vy6TMbcVc+s9T+wNqHH6THQzOjfAN1KTeECfl6+pmsKf9nZoVWRP3mjg47
         MbLYR6xF58rAm5K9anV4K+yOzp0LwMEDoAUvxCbhQ/nol5XzfEoO0ttgU+4c1a9N7Qvd
         1XWomFeVN7FzjPwwOaKPpIiGp+U+PWBpDVAQHJEyhH2Irgl11tv553/jfKvT1lK8eF2p
         ZgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795187221; x=1795792021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9CwbjPZ+Sgw1ndd0ojkmOYPv2IF6fDVO7S7jEJJhl8w=;
        b=D52E9BAFm2ZRuZBifPz8XOHN7OCsUvXHSXISv4zmzEdJLiD1Ep2bkFMBICb9quk/xk
         LpdhdUUWw5pNsSg2G83aXG7pXWy7vugSRaHn8fkVoQDY9InrtOgkOQgB/QtRW+VGx9P+
         Q03wsdDws928K5WlGTAfZNhI3wYiXWKvBIK3x5AYthJUGSG8LLBeOAqRsw3YJai7p5r8
         q3LUio2xgf0C1XHnVoEcDmDv2jPVTQwX5DSd5mOEijnqiuIDqx90nPZYJDIuGiPSb2zq
         EQIhkau8ihcX7vRqk3w1sXdmyDWyypsUQ7dljkZMES/VNG3dNYOfqq/2CeREkJb2v5bj
         KTrg==
X-Gm-Message-State: APuU4Z/OEnSDiPlXq17O7maHfAnfNkG7xYfDbqktsf74Hpzdbp4ct3PL
	v/6dtqG9ug6+WE2ggUkN2upTT0mTOrjzNoEHlIxEgRWS0VhAzRhTdeUt
X-Gm-Gg: AYBFou3MNO1qCfmsTIrHjCaE4SshNST2ALNYa+ahqwOJTvAxa38yygcCXik5lb52WjX
	nEyiSMq6MevGyL3humMMSA16vdILAQZW243IJV6QFLzTcgqsyLCrN/CIF3fbbFLB1JDqWHWxHuj
	/2Og7c8cYwOMdW/6kAvObio89oOiX4Z7VlBjVB1yotzPwg6Tn995dtylKyvccUh0suTmMBCdQhM
	FKGGJfYgBWxo/5qZ9lq8YdnMS+CodMHPgcuc72Jnx5JZuk4DjzzSeH0hqlnyC1NXtxL3ih8TiIN
	myAD/Dvf0hj6KU1KN1pO3rFAb262F8nwS0FXFS9YESZOzAgYjRQHuZuwkOwnUOu/2Uqf4X65QZO
	NyTYBRy8/wbGtf7jWgwjKhG7ANZ9cxZacqjq6u/q0hziTIFpAJE/Q0z96Kkeoou4Ekx/jyMzlU3
	M3Jgrlp7VdTeJ2t8GpY5y0YeY7//QE4SrQgR9VyJ/DOv0iKquYEQvZX6iXp/58kxhSEj/00NQZf
	npNeAJvTnEpReNdg95sp6XEg7x4rPZk5fdKL46PnqNMc7w0xxL+4p5cd02/D/3YmFZ22sa5xdBL
	7RVMe5errEV9eSCZ271e7XPd258/nRpN9T7lQLqgMfYEu7VvYYFC3eEc8HhUQMxcv4NM6unFvSH
	kNsVfL11n
X-Received: by 2002:a05:7022:f907:b0:1b2:558a:d781 with SMTP id a92af1059eb24-1b5567b5788mr2642760c88.5.1795187220737;
        Fri, 20 Nov 2026 07:07:00 -0800 (PST)
Received: from IN01-9QQVVV3.CAMNWK.COM ([171.76.82.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm7844902c88.12.2026.11.20.07.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:07:00 -0800 (PST)
From: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	bpf@vger.kernel.org,
	Shitalkumar Gandhi <shital.gandhi45@gmail.com>
Subject: [PATCH iwl-next 2/2] ice: wait for one RCU grace period when destroying XDP rings
Date: Fri, 20 Nov 2026 15:05:27 +0000
Message-ID: <20261120150527.14649-3-shital.gandhi45@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120150527.14649-1-shital.gandhi45@gmail.com>
References: <20261120150527.14649-1-shital.gandhi45@gmail.com>
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

ice_destroy_xdp_rings() calls synchronize_rcu() for every XDP Tx ring
before freeing it. num_xdp_txq is sized to the number of CPUs, so on a
large machine detaching an XDP program or rebuilding the VSI waits for
well over a hundred back-to-back grace periods.

The wait makes sure in-progress ndo_xdp_xmit and ndo_xsk_wakeup calls
have left the ring. Both return early when ICE_VSI_DOWN is set.
ice_xdp_setup_prog() takes the VSI down before destroying the rings,
and ice_vsi_decfg() runs on release or rebuild after the VSI has been
closed, so a single grace period before the loop covers all rings. Do
that, and use synchronize_net() as ice_qp_dis() already does since
commit 405d9999aa0b ("ice: replace synchronize_rcu with
synchronize_net").

Signed-off-by: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
---
 drivers/net/ethernet/intel/ice/ice_main.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index 47c6798c9..ed5103e8c 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -2802,12 +2802,16 @@ int ice_destroy_xdp_rings(struct ice_vsi *vsi, enum ice_xdp_cfg cfg_type)
 	}
 	mutex_unlock(&pf->avail_q_mutex);
 
+	/* Let in-progress ndo_xdp_xmit and ndo_xsk_wakeup calls finish before
+	 * the rings they may be using are freed. The VSI is down at this
+	 * point, so one grace period is enough for all rings.
+	 */
+	synchronize_net();
+
 	ice_for_each_xdp_txq(vsi, i)
 		if (vsi->xdp_rings[i]) {
-			if (vsi->xdp_rings[i]->desc) {
-				synchronize_rcu();
+			if (vsi->xdp_rings[i]->desc)
 				ice_free_tx_ring(vsi->xdp_rings[i]);
-			}
 			kfree_rcu(vsi->xdp_rings[i]->ring_stats, rcu);
 			vsi->xdp_rings[i]->ring_stats = NULL;
 			kfree_rcu(vsi->xdp_rings[i], rcu);
-- 
2.53.0

