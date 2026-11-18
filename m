Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795031770;
	b=pveR3sxrjmDl3KsUTRN/WXBT7zE2laH2aVabveabnpC2xCGVsbY4/KKTv2c11hPywJsa
	 /mdMug6/ANyGeMcCoTzTGNDmEqX3G6kei/YMMOP/E9xr8RKWWLAgpCml9JWYfV63ooD7l
	 Bbcv3uJm/fGE8UvQKwaEmRkklNyeXvmNo49vhWzZ+z/Fjy1F+yKsm49VrACGe3yYE/Lyt
	 F0nGNagNKtGxei3pzB1mlSD5iMsRtzO75GM7r1U4T9HiITKVS5kn3TkorHrDJq0Nu8r/Y
	 J+aWz+8G8Yq9U/8MwT6kQp+9PCGPaaRjiCMJqKBkHohC+0ami0a6yCtSPllemSQ7CPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031770;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=sNpQOKsTWfR+eXJ65vVv6WscOAbh7o0/2Tsak6vgxuY=;
	b=jLcq781QdJ6hrMRXlTSk4ZeOuegRIgIpuZDHpLHM95DlKJ9YkeUl6v+OixdZYb0fHKai
	 uOYjfd8r2dhC+5JNOMfNhKYyWCBqfyO0Q1tEJ/IEwtIiQGUeJ+EqYgS8f6iWyn8S+wt/v
	 iyx8zq+WmwuQPFUwh7aRQ+pqKjNJ2F7Chob5O08Hnkatk1OrVNSBCj3dqF0Nzd/jGUWHG
	 Upi8QADbQyhRLD1kMGA8NyWNhGx46RHLDzJ9r0zqUNrqc2do/yCLRlYd5v1sRHwbbC+Cf
	 L0wga5h4xB/xkDVxyqAqv7Hs8MogzSImPlr/gdv3mf2fTRQogvLeIRJskgh7cvIroxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b="k1/OyE93";
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688A0606A32F;
	Wed, 18 Nov 2026 19:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 688A0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=k1/OyE93
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2BBDDA230D;
	Wed, 18 Nov 2026 20:56:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795031767; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sNpQOKsTWfR+eXJ65vVv6WscOAbh7o0/2Tsak6vgxuY=;
	b=k1/OyE93DfAHuumlWQWXfRlcAoHbGEB1cgvrcdlSy7H010bxjMrkVEdEG/6NUt0CodG1GX
	e5mueOCVZMJ81cwWhlV+CQDH1tn2bEy4DSS18o2shFpWOEy/UTLTZ6M7HcoyFkYGlGJH5E
	/sMDupclADccqOJ0pwCW9jIqRYVoCPDeHo75UIVRtS6G/Ihyuf0G5SXCVP4ic4Y9/v7y7V
	f0DsKUEeNJlo8K0rXe+hSuB7ihBssWQURWYfqV8PBwp+KtmsU8wjUQxp0Z1NKSCPCp1oUS
	YQoEc8uQd/MwsqUrfdfDvCMRw5syZEChCbBagiUPLF5j3vNqHu2uQxRMz3Xe+g==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Wed, 18 Nov 2026 20:55:31 +0100
Subject: [PATCH net 2/4] net: bcmgenet: restart DIM from the default
 profile on ring init
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-nb-genet-dim-stats-net-v1-2-13b275f1e088@tipi-net.de>
References: <20261118-nb-genet-dim-stats-net-v1-0-13b275f1e088@tipi-net.de>
In-Reply-To: <20261118-nb-genet-dim-stats-net-v1-0-13b275f1e088@tipi-net.de>
To: Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Nicolai Buchwitz <nb@tipi-net.de>
Cc: Justin Chen <justin.chen@broadcom.com>, 
 Petri Gynther <pgynther@google.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Florian Fainelli <f.fainelli@gmail.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

A close can cancel the pending profile work and leave DIM in
DIM_APPLY_NEW_PROFILE, where net_dim() does nothing. Adaptive coalescing
then stays stuck after the next open.

Reset the DIM state on ring init and start from the default profile,
which is what bcmgenet_init_rx_coalesce() programs.

Fixes: 9f4ca05827a2 ("net: bcmgenet: Add support for adaptive RX coalescing")
Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index 70c6a6465c81..96620d298677 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -2702,8 +2702,11 @@ static void bcmgenet_init_dim(struct bcmgenet_rx_ring *ring,
 {
 	struct bcmgenet_net_dim *dim = &ring->dim;
 
+	memset(&dim->dim, 0, sizeof(dim->dim));
 	INIT_WORK(&dim->dim.work, cb);
 	dim->dim.mode = DIM_CQ_PERIOD_MODE_START_FROM_EQE;
+	/* Match the profile bcmgenet_init_rx_coalesce() programs */
+	dim->dim.profile_ix = NET_DIM_DEF_PROFILE_EQE;
 	dim->event_ctr = 0;
 	dim->packets = 0;
 	dim->bytes = 0;

-- 
2.53.0

