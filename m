Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017107;
	b=2afs/fTzG9WIIZY5RtAlZc5PnAekn9Y6SjIfTG8isHUZiWmBv/Bf9rXdk5dM40t3ILty
	 QDkVHocQEHwsql0sHMTTQrQxZZ/ygP/bDIguwWRnvGAgfe1d+pA2GC47g0He30Vc+rsBC
	 VFETg9MmRl/bIxWybqs4WUmi+y9NJd5VKw1YcyA6tUGqUkIlgq3fkT9fgvAbalPlFDl5e
	 TbTqNsp5A3L1sKd4DlUnWjRryCjO0M/vY2r4uC6dLJEKH1vSxScvUa/rAEocd9OECEZC8
	 baSQOtOWZl/6le9eJfNQyinonzhwbxPlc49UQS8dAf50KnNz7oVxBkJ+pRwTJ508Jow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017107;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=VXQKShqbqAA5ohxo0SK/295AUZ/WkykTsmpbukJPNWA=;
	b=NhTCdgI5/fRBMHFqUeWIfwJaR2ZhHvO1SMZaQWp+rfch0ehdphwAVZlrpItUv3AFCTBU
	 +IuaLRXUsqmPYTGcuUFcoCAkQQhhEYXRW3B/k5/DhahgW9G6R847Tsrxn2Pd/5jiBsJ2g
	 EJj+yswXtmzDRa6b6RD0Bp19bqlujflejPGU61SBMfUE2TW+n9+HaUzNBu9ici7uwr0ik
	 VmNdn2IOZazlsbhzIXGURFPsiF9mqEeCKvlHNKJq+8Fc+0E7pdKvpp0T33jg/gbXOuLKe
	 WP+6Qfy+qqPvkgfrZn/7PeC2PIoodg09GQEKSnYvyrLYu01nTsxUgoWgxG0tnrKzvOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xidddx2s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A05606A331
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xidddx2s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FD81F000C6;
	Wed, 18 Nov 2026 15:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017107;
	bh=VXQKShqbqAA5ohxo0SK/295AUZ/WkykTsmpbukJPNWA=;
	h=From:To:Subject:Date;
	b=Xidddx2se8FZENP05h8/L/LKqyVOjCUAK8+tHhRw/7G+9p5ZOBCYuvTaL+6kxFzZa
	 zAoEwG7fU6e4UHtcve+YdQWCuEJUUt8KB7XYwYhoaGBW19fzcmJaisCZ1AxmTZU9e6
	 6mncgniL+HCcwAlDyECYzVe/gAb92OFI5fz4Uh0/Sm4uM6KQOjhBjQOH1LT9fOQwol
	 MoTY/8t0LLFvJgnYGG9uCaflwpGyKTMnWwS5iFHtI+imLbAJibDCRQYjdyJq8SZ9UH
	 ODdJsO4HKT8T4ungaiDTOfClU1hsJBOXur+nRhHaNoEzsqlGk2gxKFSf4IA9LScXo7
	 lmCuSOStIPgJw==
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
Subject: [PATCH net v2 0/5] tcp: avoid integer wraps in the RTT estimator and the RTO
Date: Wed, 18 Nov 2026 10:51:44 -0500
Message-ID: <20261118155144.18393-1-mason@kernel.org>
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

This is v2 of the RTT clamps, with Eric's review folded in.

Patch 1: __tcp_set_rto() never returns 0, so that the backoff recovers
from any state of the RTT estimator.

Patch 2: tcp_rtt_estimator() clamps each sample to 120 s, so that
srtt_us, mdev_us, rttvar_us and the sum in __tcp_set_rto() can't wrap.

Patch 3: tcp_rtt_tsopt_us() rejects a TSecr sample above 120 s.

Patch 4: new, from Eric's review. tcp_rcv_rtt_update() clamps its
samples too, which covers tcp_rcv_rtt_measure().

Patch 5: new. tcp_rto_min() bounds the locked rto_min of a route.

Eric, I have a question on patch 5. You pointed at a locked rto_min of 0 for
patch 1. We can also get an RTO of 0 out of tcp_init_metrics(), which doesn't
go through __tcp_set_rto(), so I bounded the metric in tcp_rto_min(). For a
locked cwnd of 0 you wanted ip_metrics_convert() to reject it instead.

I didn't do that here because claude points out that "rto_min lock 0" is
accepted today and mostly works, but just let me know how you want
this to look.

Changes since v1:

- Patch 1: no code change. New changelog and Fixes: tag (Eric). David
  suggested "return rto ?: 1;". I kept max(), since tcp_rtt_estimator()
  ends with max(1U, srtt).
- Patch 2: clamp mrtt_us itself, so that tcp_bpf_rtt() gets the clamped
  sample (Eric).
- Patch 3: no code change. The part on sample << 3 moved to patch 4.
- Patch 4: new (Eric), with min() instead of min_t() (David).
- Patch 5: new.

v1: https://lore.kernel.org/all/20261118005048.53393-1-mason@kernel.org/

This is on top of v7.4-rc3.

Chris Mason (5):
  tcp: don't let __tcp_set_rto() return 0
  tcp: clamp RTT samples in tcp_rtt_estimator()
  tcp: reject RTT samples from TSecr above 120 s
  tcp: clamp the samples in tcp_rcv_rtt_update()
  tcp: bound the rto_min of a route in tcp_rto_min()

 include/net/tcp.h    | 14 ++++++++++++--
 net/ipv4/tcp_input.c | 21 +++++++++++++++------
 2 files changed, 27 insertions(+), 8 deletions(-)

-- 
2.55.0

