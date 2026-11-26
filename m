Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710754;
	b=wNH1FwwhnaFJCrDMSFZ0UqeAE+5SEWum2mxQ21GTdUgM9aViZA7RluX83G4ERVtIhuyt
	 9KjgtIr4UkT4sSz75IqMam8X7p669LnfjuyLFHCrDYn00ORBq0A0zs9ghtRh+eNmznQUk
	 WRLfeJUgip36T0GLNHDcA0C2GLDRB7eZITcxET3+eqqTgTPL2oz7aaHfO0yB3AUNtFnMv
	 fvykkTMXu6QA6um10HE27KcuUZRMq8rGAoeMKufCeSl5uI03JkVvLbiLWJaTs/Aop1huT
	 bSDBYgKQbNJE4lc6WtdUzBXoQb8wEa8yj9I/7AT/4dFIP7a3eknkK9hxMkZMQjOVCYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710754;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=/88f0OpcXzhjtRaStYqITZpu1DdMZ3cXWkyqB1mOE78=;
	b=0cqyVmo6N+oti//LuWoqzl2bxcANHiRXwlfav/SgISAQDyziQlH5Gl4SjukKxWiJpFm4
	 bUSDBVnGpwKYKvHZNqmChy14IoLXW3c5uB2bflu3HhToQyo6Q928XA0BBvDXPZumjGlao
	 jLsE7GibI7o7G3lYAvgRXSUx5+G5ZG80nK2Ai1OGYm4IBm5QBXic3qkhiDwZMzpWdg80U
	 S1thjs8pkSvWlM8u+q4Oi7Vg0QmZLkc6bnj2NQEzIOTjoRvz+IydDO/h+lVPRyegZvosh
	 C/w2PoUgrYMOi3NAe7Vl9TyP5epo0kg3Lu4CeeWleOtEUGQHbtyATiK0kj9ueLH/owA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=tz18tl4Z;
	arc=none smtp.remote-ip=195.10.208.46
Received: from mout-b-106.mailbox.org (mout-b-106.mailbox.org [195.10.208.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D02606A323
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73D02606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=tz18tl4Z
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-106.mailbox.org (Postfix) with ESMTPS id 4jb2Bw0xshzNlfR;
	Thu, 26 Nov 2026 17:32:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795710744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/88f0OpcXzhjtRaStYqITZpu1DdMZ3cXWkyqB1mOE78=;
	b=tz18tl4ZwpurkADPD4OxqV7ULQUVqd5P50UjBMh7HLxqpxt38jqBkIpS6zAFb4KVzZhp2w
	hXJggsZ7YNmpNZ5pK1dHVkT8EGmJLyJbLw2UYQ1ewxy1puw7BuvngNxWLthTdTVxruH5K6
	EyqREYPqBKc5U/KtVdWwW33GLcHpUEtPXZ6YFelD6jLY+nJsmrnmESY+HGMrzsFVzwtXJI
	6O2SFx/MtL3SaQZcP+faoroefq8xr8DyXE9tSe8BIVYx9kLXCQomFEpWY3g5rN50xLuNrm
	zTmVMKaycqDVjvKVF3JGdBPRNtGIXvhCRoV3Dpmrm67tnQA4yHNaXe6rtr5QXA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of antonio@mandelbit.com designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=antonio@mandelbit.com
From: Antonio Quartulli <antonio@mandelbit.com>
To: netdev@vger.kernel.org
Cc: Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>,
	Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Daniele Palmas <dnlplm@gmail.com>,
	Taehee Yoo <ap420073@gmail.com>,
	koen.vandeputte@citymesh.com,
	Antonio Quartulli <antonio@mandelbit.com>
Subject: [PATCH net 0/6] net: qualcomm: rmnet: fix TX aggregation and teardown bugs
Date: Thu, 26 Nov 2026 17:32:13 +0100
Message-ID: <20261126163219.1744750-1-antonio@mandelbit.com>
X-Mailer: git-send-email 2.56.1
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
X-Rspamd-Queue-Id: 4jb2Bw0xshzNlfR

Bugs in rmnet TX aggregation and bridge teardown, found while
reviewing [1]. Each commit message includes a reproducer.

All were reproduced in a VM (KASAN, kmemleak, DEBUG_OBJECTS) before the
fix and are gone after it; patch 2 needs a debug udelay() to widen the
race window, patch 3 a 32-bit kernel.

Although this patchset is targeting net, the described reproducers
should help maintainers understandsing if patches should rather be
demoted to net-next material...

Regards,

[1] https://lore.kernel.org/netdev/20261002143529.3217189-1-koen.vandeputte@citymesh.com/

Antonio Quartulli (6):
  net: qualcomm: rmnet: recheck the aggregate after flushing it
  net: qualcomm: rmnet: always arm the flush timer for a new aggregate
  net: qualcomm: rmnet: fix TX aggregation timeout overflow on 32-bit
  net: qualcomm: rmnet: stop TX aggregation after detaching the port
  net: qualcomm: rmnet: account linearization failures on the real
    device
  net: qualcomm: rmnet: unlink the bridge from the vnd it is attached to

 .../net/ethernet/qualcomm/rmnet/rmnet_config.c    |  7 ++++---
 .../net/ethernet/qualcomm/rmnet/rmnet_map_data.c  | 15 ++++++---------
 2 files changed, 10 insertions(+), 12 deletions(-)

-- 
2.56.1

