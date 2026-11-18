Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794963051;
	b=W36iZPupLymc3kPdnRjuv0lrNs3LLvZoFvHusZQ6btlgr9zN4tb7D5DU+XhXbwb5cqfw
	 /vuX9CAWxPdumVNHg6NB5Dgeq7x1H0zR7JcFeFbib1Au8wwP1QKKjOzDxzLdHl0m769m1
	 P+SH8hzWIxEnfYNLYWpNq2BXWsRWCQkulWcmwbE4q5UxnLC+YK2xGS3sspBqmMGk2gNMy
	 G4r5d9aRl8bRBRtlKlySKWqZ9C8ptsY44vuUlvNPtXlwg2gvg8Q7Oo7vS9tZMkT8Dqs6X
	 w/38tjOhQOKS08wh4VX/pMAEDeYhFjilFTsS70xe9N/IVrKlNy7jlKnVOVnC1jRt60A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794963051;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=CrhiOwFKPXriExOM8b7/HQoICtjYS/A41ueHrS8eWis=;
	b=gAUhlLhBEXDiFXcCXjel6WKQbLUutgMjPjBp4AdzL/YaN1XuUP5bIvHuG5VG7hrbPoIW
	 rud3g0O7lw298smzTg/osbWiuY2t93QxNA5Mfpgz/oOdOV/s1VqtWJQFVKpo5t/dxXyTG
	 U8iQhMBQwczp2P6B2Gc/O5ZOyHGBRoy6kyUuZ0zY4sdIiK1RQUxvyFyOXB+esefdpmOij
	 +MK133VTnUzaaP/5Z6SOWdQVKv2JXi5QNgc2OepqGFvNqo42C1BEIQBjaZY1X6uWCjr4+
	 BjCVVrHVn3rgRaWUww2yNfo5z76/LZIJAgZo+eWKWr9kGPNlnaAkIsZ+rTGyc1bYUdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l6VxE3rE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01044606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 00:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l6VxE3rE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 552991F000C4;
	Wed, 18 Nov 2026 00:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794963050;
	bh=CrhiOwFKPXriExOM8b7/HQoICtjYS/A41ueHrS8eWis=;
	h=From:To:Subject:Date;
	b=l6VxE3rE6I6obTPpEKoe1HpCYsIEROWfd7XvOflX/XtyuAWyObwayrVmAAs6R2P23
	 0Uya/LkXThl9rGyQGXsG04OM8P7/eOzH9ob+jF6eQeEtlg9nXMUJHa9KV6EiyJ68on
	 jPWsqVI++dvvbDCLLz60ksD786b7aUzyqblfWFTxvEtV+Hd3moM8uG/ulVxNdcj2rH
	 A7fEZxC70NKTmwNPitFtwwTYPulaUV6Tl/JZkC4frKdWbFaY3WhTT32NvgsoKp7OSp
	 P1MtOaZEWHJiuk22sQ/mSK2etj9ieSSHVZsg2BY4PEFF8wReNiVj6qrJN/3Ov1IgY6
	 w7hz4zjRrrT8A==
From: Chris Mason <mason@kernel.org>
To: mason@kernel.org,
	edumazet@kernel.org,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	willemb@google.com,
	josef@toxicpanda.com,
	netdev@vger.kernel.org
Subject: [PATCH net 0/3] tcp: avoid integer wraps in the RTT estimator and the RTO
Date: Tue, 17 Nov 2026 19:50:48 -0500
Message-ID: <20261118005048.53393-1-mason@kernel.org>
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

Hi everyone,

These three patches keep large RTT samples from wrapping the u32 fields
of the TCP RTT estimator.

Patch 1: __tcp_set_rto() never returns 0, so that the backoff recovers
from any state of the RTT estimator.

Patch 2: tcp_rtt_estimator() clamps each sample to 120 s, so that
srtt_us, mdev_us, rttvar_us and the sum in __tcp_set_rto() can't wrap.
This covers the ACK, SACK and TSecr samples.

Patch 3: tcp_rtt_tsopt_us() rejects a TSecr sample above 120 s.

Thanks to Eric for suggesting patches 1 and 2.  This is on top of
v7.4-rc3.

Chris Mason (3):
  tcp: don't let __tcp_set_rto() return 0
  tcp: clamp RTT samples in tcp_rtt_estimator()
  tcp: reject RTT samples from TSecr above 120 s

 include/net/tcp.h    | 11 ++++++++++-
 net/ipv4/tcp_input.c | 12 +++++++-----
 2 files changed, 17 insertions(+), 6 deletions(-)

-- 
2.55.0

