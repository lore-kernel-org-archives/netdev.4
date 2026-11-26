Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705435;
	b=5OLuPwtRO/WkULAjpF9GJyTUQ/ZXAc5fkU6YjQWcLUUvvN4MK9aZYE9+ZvGUxTEkztJk
	 J2yZx17XTikSYkOz8PxURCwBP9dn6NT+s/LM/MF9mMYsjxtCPpcyxtcKLlimKzRtScA2+
	 yn+mulxaf2QFyGq/Ijk6X2zo9YQEZcgyE5vYchJ8uQf1bkX4m7jwNKHY18OZkg1NFF19z
	 DAI4bco8DbUp6dsu2W+LcrKW1Tw8LTq39caIiwSZnAsh6glfbgTKhyi0rI9afwR9eFiB9
	 9s8eUYq8Fo/z3XSFFGzbM+sgQXhWeyNRsFrWxktvoImvh1ze6I5GuIcfFNeW7kl1Y2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PJOfhzzym9DT0EIFhuMmQjcHheutHEEjTA2C5YGcm5c=;
	b=YSHzfq5VWdcJfCNn4V/sSn1G+zJXTXTOkh3X78aC4u20J7hHbjCwkyLlmdVhskSDmQD9
	 EGJboxgI6QQBCYLcvaYdB2XlH+XZHzGXvTlkGHhOgwAu3FmNzuFEFkURay7qDReqVwLeK
	 a8gyX90AEhjAARGxoFQfltcWuJEuHOtCk0B+uFLQ+Ct7/4VJbEQ5oRE3I9PzpWlPLGU6f
	 6Uc0vovdLpmLL/UzQHnt0iUO9g3jX3A48hAmMCW6py2RfHXhXAOJLwvzfAGYcKNHnNQRf
	 vv1aOwiEjVG5vs1ebjIKAV3IE40i/p2RQcEGA+syoURHpOaPMFqgeGWWN67BN/LqEcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=CUz4qxTa;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180BD606A326
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 15:03:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 180BD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=CUz4qxTa
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3863db981d4so10015274eec.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 07:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795705433; x=1796310233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PJOfhzzym9DT0EIFhuMmQjcHheutHEEjTA2C5YGcm5c=;
        b=CUz4qxTaHsZSn2Z5cIKiNHsqeDxLJG/OyCSgr3La1Dixk2LDnNf5+nfaTHtvhyDTki
         lpqxJEz7tK+ko9GG1vyJt9DtBaX1QKnq4kQtrtvZQg3T81fa95rO3R2ZCdRcB6iiKNiQ
         IVwLcJMXE6thEag8L9KzHtYzg+mDZCmIF4Cow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705433; x=1796310233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PJOfhzzym9DT0EIFhuMmQjcHheutHEEjTA2C5YGcm5c=;
        b=j/urIw2rV07VRWZwBWVFCLQKEB59N3FVVs6GA78NIfmmz8fEVoYOZFCW8arSduRa6M
         5ZgYaKULglZMqxlxW8f+c0G1d3SzjvXoS3YSg1XZgncZJHbiz8SWCrPyGBM6yFvtOrWg
         x5e6Th8NYd0GHdiSDmwPJLl/hbhNrpaD/q6qS8ZwKqqaNvxIBuKNcwA4vzZ33fLhntCv
         90+5IVYdoCINvEbmcz72LN2kknCurObaUBOpv/YeFCWuWgWgd/4uc0uX69+X6bEe5Ku0
         dPYhV7tGJ//J6DU7cxOKHKEUPvSviJT6kkVlHnnAD02RaM06MMTqKQAHSCRtbhG5yIH/
         oAiQ==
X-Forwarded-Encrypted: i=1; AL+hErFqyiDwRcqXKT/5gqUscRfEeJ3Misq0onZDiQDfxac1/H70Q8MGtEuNbt5jkKxYydhTRMVDTR0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JXqr+UrmwZNeW2dQGLXTeypugo6QmHVzJ+GF2BIe32Pur0Y0e
	qWK0fCofYRYRTdPPT9Tlr6qsM1jgDBZ7v7v6oxbD9bnsEDeFup0zUyOq5cQwGYUdvU0=
X-Gm-Gg: AZFdTZeJdohRfo+Qr31mynbKuusGf18xaWDb587Es+P58G0+Hiz0/aniCyvMhszfKiV
	aVYQWP9ZThL4j1Lqokl0AyvCaYaolI4RopjS3mIFeOUvrfqITpr8miimG0D7a9SV+vYLDY9pLsU
	TyyFHfvJr3HZrVc9GNkxxgzW3qNHGbQwgk7AyiHREUg/ZJCDZ/rE9TiCOrlQn41D00a9+/LemGO
	dmBget2oNUeLJTjm3w3dHi+uYLXfa1R9L/iHOzoUYDLEen0C+iPcKxDCXXKQ3jLLJYDSCNCrjdi
	vShwwnDoE1VjfwuQzrgK/Fv0KhoFRSVLJ2Kb1dwM9asyhKXXw8UX8aOCwAAN3R/+1M03/vYeng4
	hQDFmoIeDDNl2ehpIA2pCiW4awujcjOkUXeF9CIIOMY4JDiiZpm17cCr83qdTvdo3vNtZF4y59e
	LIDsOHAf2FZOJ55rFuVsJDhqFNutuLBfZQAGhdUo3OlUSzQGHPJDTNr7JXOxxM3idkLYygp95UO
	Y8p8LKbM28tcVcfz6MWZEV3dRaYrE5KBNOS6Hchn7vZ2elXQBzW486Fwd5Dh7ZRfPlp3I3DMSzM
	rG+ylSLSUSOgzbln1UwKr6s9OcgAh4KL4GnlYIgicr0c8QIfD04pnjLAuCM7AfzkvmnyvT99ctU
	vreIoe3qXKcKsj7jANTBAmWzs1nUsTlQ71vRcwcPudQBkH9x3cru8MiQtedV3r5EL
X-Received: by 2002:a05:7301:78c1:b0:386:a3fe:44de with SMTP id 5a478bee46e88-386a3fe4616mr15220865eec.28.1795705433115;
        Thu, 26 Nov 2026 07:03:53 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm72602013eec.26.2026.11.26.07.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:03:52 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Robin van der Gracht <robin@protonic.nl>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Oliver Hartkopp <socketcan@hartkopp.net>,
	Vincent Mailhol <mailhol@kernel.org>,
	linux-can@vger.kernel.org
Cc: kernel@pengutronix.de,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kapil@presceralabs.ai,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH net v2] can: j1939: reject an out-of-range data packet offset
Date: Thu, 26 Nov 2026 20:33:46 +0530
Message-Id: <20261126150346.2110171-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <sashiko-outbox-233959@kernel.org>
References: <sashiko-outbox-233959@kernel.org>
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

Thank you - both findings are right, and I have read each mechanism in the
tree rather than reasoning from the patch.  v3 fixes both and is posted
separately.

[High] session leak in j1939_xtp_rx_dpo_one() on repeated invalid DPO

Correct, and the leak is as described.  j1939_session_cancel() only acts
below J1939_SESSION_WAITING_ABORT:

	if (session->state >= J1939_SESSION_ACTIVE &&
	    session->state < J1939_SESSION_WAITING_ABORT) {
		j1939_tp_set_rxtimeout(session, J1939_XTP_ABORT_TIMEOUT_MS);
		__j1939_session_cancel(session, err);
	}

so on a second out-of-range DPO it does nothing, while the
j1939_session_timers_cancel() in front of it has already cancelled the
500 ms timeout unconditionally.  The session is then on
priv->active_session_list in WAITING_ABORT with no timers, holding its
receive skb and its netdev references, and unregister_netdevice() waits
behind them.

v3 deactivates the session in exactly that case, as
j1939_xtp_rx_rts_session_active() already does for a second RTS.  It tests
the state before the cancel, so the first bad DPO still cancels and lets
the abort frame go out with its timeout running, and only the session that
was already dying is deactivated here.

[Medium] aborted session completed in j1939_session_completed() on EOMA

Correct.  j1939_xtp_rx_eoma_one() checks the PGN and the message size and
not session->state, so an EOMA arriving inside the abort window completes
the session.

One clarification on where it comes from: j1939_session_completed() has
always called j1939_sk_recv() on a receive session, so an aborted session's
data could reach the sockets before this series too.  What v2 changed is
the extent - looking the message up at offset 0 hands over the whole
reassembled message rather than one window - and the second
J1939_ERRQUEUE_RX_ABORT you describe is queued either way.  Since v2 made
the delivery whole, the state test belongs with it: v3 returns from
j1939_xtp_rx_eoma_one() when the session is at or past WAITING_ABORT and
leaves the session to the abort path.

Tested on 7.3.1 with KASAN.  The reproducer from the v1 posting still ends
with the session rejected and no fault, and net/can/j1939/transport.o
builds
clean.

pw-bot: cr
