Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467364;
	b=ROmwVb0UrLV0wfzON4BeOJNDy27VJQxeP5oeSFoBsrdgH9tP29N1bn5/4kh0EQ4CB/1o
	 TGB+Hgj7o280cWVdbgwWQF56Wari2mXNUlyYasCTn1DJ1qNZez+fl30fVNs/ng9Coby8V
	 bWWG8w61xQacCIvMalK0kj0U47F8ODnIAD4T2vaCl+Y8WZEz4tYh5R0vlYVH+91SJh3ml
	 U80RHN8k2SqXpzIepJ0w26qtaIhCbBYVQz1vhc+fLthRgJd7/bWNKQVnOvtRUyzSxTS07
	 SbKfYgshhSB7MxC0h32+qbl+d20oU3AkntmkusXNgMWfHgkXIHYzL+qtC4SIoIc5HxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467364;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HAvjf+qFnF2PlnNrWEQfKw74csMPKo5xN9MJAY/vfc0=;
	b=16jcPPk6Lw2XFZ+Wjcf9HoaiHQMctGwS7aboTyYVJY0GRNcAsfsXDTAcx2nOWNLT/jwA
	 ZN4E+N2p1vK8QhApskykrdCcR84ozBIJOzY4uY1w7g4hWltTBjdEDHbrVLd38+/zRaAdw
	 G+90Ie1+hArBGD7g6Haf9o+aEsSI5bXOYmYvNOu40kzRLuTwrD8LleOzNeKGd6B6NGjEn
	 5Obx9na2+9Y2mgfHeDiqtm1o8Wvjqfz4GAkrmJ3FBfAzJQg/JSZz2iq9ww7oKjVSqK+rl
	 eXOq6wAAv0MT7ltFng2OnxLKP2hbjfLMBB4FvrB1tfXNmkD/KVnEaTMXy5R2sovsBHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SyufintC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE13606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 20:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SyufintC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7431F01567;
	Mon, 23 Nov 2026 20:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795467363;
	bh=HAvjf+qFnF2PlnNrWEQfKw74csMPKo5xN9MJAY/vfc0=;
	h=From:To:Cc:Subject:Date;
	b=SyufintCTIvTXofljWuywuFKxyTrKNIjBQfzoo8FX1eNNrTJvqz+ff4VSTZIFMXsK
	 K+nCP53efjnW+7DH60/NPz7vYYFVf+lDu0KD8AvdVfCbtrCwcVBD5ws5DXLDO28nUG
	 lA5Tp3roSpsR8wVDxeGaZzWd/DB1RgFkqQwQ35xqumPFufkpnVmgzzdmysPIWP/OHh
	 TikBSeFbnjqCjsba/SNzHonKbIXNmWamhzSa9t0rGJHEjYjWcMB2KvSPaLmez5AW82
	 HNa6G5hLDvd4vZfuuyNTxtpfz71MX5m4xopLdv/YN2VNMzg4MoDeHNo9J0WCDaEqwl
	 6BFhMFzDQwGpA==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	ahmed.zaki@intel.com,
	jacob.e.keller@intel.com,
	intel-wired-lan@lists.osuosl.org,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net 0/2] eth: intel: fix unintentional symmetric RSS
Date: Mon, 23 Nov 2026 12:55:58 -0800
Message-ID: <20261123205600.1794292-1-kuba@kernel.org>
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

Fix Intel drivers not handling RXH_XFRM_NO_CHANGE.

I had an urge to "fix this in the core" and hide RXH_XFRM_NO_CHANGE
from the drivers, by fetching the current config instead.
But "NO_CHANGE" values are already part of the driver facing API
(hfunc has ETH_RSS_HASH_NO_CHANGE). Besides we can't _completely_
hide RXH_XFRM_NO_CHANGE from the drivers, since we want the drivers
to be able to populate the defaults for new RSS contexts.
We need a "user didn't say" value there.

---

Matt pointed out that the upcoming RSS sizing series breaks
NIPA tests, this is because the fix we shared in June:
  https://lore.kernel.org/20260626152636.1e48330f@kernel.org
or Maciej's version:
  https://lore.kernel.org/20261007200311.730443-1-maciej.fijalkowski@intel.com
is still not upstream!?

Recent discussions suggest that Intel maintainers may be willing
to ack patches on netdev directly. Let's put that to tests.

Note that I think this is a major bug likely to bother real
users so I'm targetting net. Przemek's series will have to
wait for net->net-next merge.

Jakub Kicinski (2):
  ice: don't unintentionally switch to symmetric RSS hash
  iavf: don't unintentionally switch to symmetric RSS hash

 drivers/net/ethernet/intel/iavf/iavf_ethtool.c | 3 ++-
 drivers/net/ethernet/intel/ice/ice_ethtool.c   | 9 ++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.56.1

