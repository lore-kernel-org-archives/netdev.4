Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519549;
	b=RvFotbSSWuln6xE/K8Im3ZvnCfdpmjx2D0zQFctwNmRYyPLJhh9yhhMcUAGBTsNxI1Dj
	 u18kYy3fs7Tlf/SR8/sau+Wp7o/NfpXs33bu+qmr1VJogg9sdR4DVnR4J2t1zMywWXb4d
	 nlyLmJeUzFKGQV3jRomtAinsT5OlH7uXCA2IzGv770t/Dne3c6T2PzSOcizfYESg28Fmy
	 8bjMY+5V1eEv1+cxwGgtTSelCrej9aZKLV5QTVYmt00UlYw+4z75LlcY3Z2BOeQiXaU+r
	 Y0m5Nx5N23aVUI/rXihs9HCiRFFk/TGbooYUa/73HhMcLhOi42iBOnKkaz7RR7LKlzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519549;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=RyVQK1Z+Oz5x+uKppSMePQcKarmzk5xoKypeygjKN4g=;
	b=XFlGNFK/LqUJjSeYsn3rGWbADXQnH6Z2x9pJbYFIxhQF8VWfPq8umnvlRXcJtVyGCNx2
	 /ZKnRSGYPsAvA2GtZoHkiUEiVqcG21Uk22L/xVSCUrEq/5h+GIGf99cj+frDCbLMCNOap
	 hoFUo4P8L6AHmel3/P0xNGLnm78rdRXDFuhgg4UcSS4PPANtAU7SI+590fu009+WitYd2
	 bxwW2uDGX+SiWWzpjpUSw1NJC+iB56cKhHmhK+MLJekKYo4BFlsTbj1Uhl7zXXiuQduge
	 eoaTmseA/9TEkprQPoyRlzKCqv2j+y+GUDsojjlPfdpgPgfRh67oFoYoOEp82naM/aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GYNlunbE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB86606A33C
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 11:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GYNlunbE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF271F000D1;
	Tue, 24 Nov 2026 11:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795519549;
	bh=RyVQK1Z+Oz5x+uKppSMePQcKarmzk5xoKypeygjKN4g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GYNlunbEpSoWhCRsZGPURE98FyAM8lHc0IK+SiK/kcbkS9ir5NianC8r+fcwb6wAM
	 JFth4v4usiu2LKy9ztJXmqJyexFyvsfce5d+c6PXLwBD5sUdfFSVIpB7/TFs/OP+ip
	 o/qMt7Jm3p1fTNFl/hrpZovhz7zUlOZ33Eb5uSf7VgP+lycpEK71ksYOnQ62ni/Rfe
	 PmNd0twLnGmjF0dP+rbgKKWkueMs/UJ4KsyRD6vHrD56UsKsYjmtIwPct3e5D7ZT/8
	 7lGyRs+JppoxXKUR3JIrl09lhboiEkEuI1drF7VYnsxvxDmrEhkctfKab6pELbAcxb
	 U7boGGfQRU/Cg==
Subject: Re: [PATCH net-next v11 8/8] selftests: hsr: Add test for the inline
 PTP header on HSR
From: netdev-bot+sashiko@kernel.org
To: bigeasy@linutronix.de
Cc: netdev@vger.kernel.org, j-rameshbabu@ti.com, andrew+netdev@lunn.ch,
 danishanwar@ti.com, d-qiu@ti.com, davem@davemloft.net, fmaurer@redhat.com,
 kuba@kernel.org, neelima@ti.com, pabeni@redhat.com, praneeth@ti.com,
 pratheesh@ti.com, richardcochran@gmail.com, horms@kernel.org, vigneshr@ti.com,
 willemdebruijn.kernel@gmail.com, daniel.machon@microchip.com,
 edumazet@kernel.org
Date: Tue, 24 Nov 2026 11:25:48 +0000
Message-ID: <179551954823.3135.2068695558133971717@kernel.org>
In-Reply-To: <20261120-hsr_ptp-v11-8-264c88f4f1d0@linutronix.de>
References: <20261120-hsr_ptp-v11-8-264c88f4f1d0@linutronix.de>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Neither hsr_ptp.sh nor hsr_ptp_test checks whether the running
  kernel supports the HSR inline PTP header, which was added earlier in…
- [Low] The file-header comment of
  tools/testing/selftests/net/hsr/hsr_ptp_test.c (lines 2-11) says the…
- [Low] The commit message credits the idea only in prose ("Test
  suggested by Felix Maurer.") and has no 'Suggested-by: Felix Maurer…

--

selftests: hsr: Add test for the inline PTP header on HSR

This adds a selftest for the HSR inline PTP header used with ETH_P_1588.
hsr_ptp_test sends four PTP frames through the HSR device with the inline
header. Each frame requests port A or port B, with or without a
caller-supplied HSR header, and the test checks that it shows up only on the
requested slave with the expected contents. hsr_ptp.sh sets up a three-node
HSR ring and runs the test in each namespace.

> Test suggested by Felix Maurer.

[Severity: Low]
This isn't a bug, but should this credit be a Suggested-by: trailer instead
of body text, as described in Documentation/process/submitting-patches.rst?

> diff --git a/tools/testing/selftests/net/hsr/hsr_ptp.sh b/tools/testing/selftests/net/hsr/hsr_ptp.sh
> new file mode 100755
> index 0000000000000..23379b1ce7a56
> --- /dev/null
> +++ b/tools/testing/selftests/net/hsr/hsr_ptp.sh
> @@ -0,0 +1,109 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0

[ ... ]

> +run_ptp_hdr_tests()
> +{
> +	echo "INFO: Running PTP-header tests."
> +
> +	ip netns exec "$ns1" ./hsr_ptp_test -H hsr1 -A ns1eth1 -B ns1eth2
> +	ret=$?
> +	stop_if_error "PTP header test failed (ns1)."

[Severity: Medium]
What happens when this runs on a kernel without the inline PTP header
support added earlier in this series? Does it fail where it should skip?

On such a kernel, hsr_dev_xmit() has no hsr_ptp_parse_header() call. The
inline header is not stripped, and the frame goes out as an ordinary standard
frame. Its destination address comes from the first 6 bytes of struct
hsr_inline_header (req_tx_port, has_hsr_header and __pad0).

raw_recv() skips that frame because the destination is not p2p_dst_mac. It
then times out after 100ms and returns 0, and recv_verify() reports:

	if (port == HSR_INLINE_HDR_PORT_A && ret == 0) {
		printf("Error: Missing packet on portA\n");
		error = 1;
	}

main() returns EXIT_FAILURE, and stop_if_error exits with 1 instead of
$ksft_skip.

check_prerequisites in hsr_common.sh only checks for the ip tool.
hsr_prp_redbox.sh in this directory already has a feature gate that skips
when the kernel lacks support.

Could this test probe for the feature and exit with $ksft_skip, so that
mainline selftests run cleanly on older stable kernels? The commit message
also doesn't say that this kernel feature is required.

[ ... ]

> diff --git a/tools/testing/selftests/net/hsr/hsr_ptp_test.c b/tools/testing/selftests/net/hsr/hsr_ptp_test.c
> new file mode 100644
> index 0000000000000..e2c2da56138ae
> --- /dev/null
> +++ b/tools/testing/selftests/net/hsr/hsr_ptp_test.c
> @@ -0,0 +1,496 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Simple test to verify the usage of the inline header used for HSR with
> + * ether type ETH_P_1588.
> + * The inline header has to be stripped, the sent packet must only appear on the
> + * specified port and the interface needs to accept a foreign HSR header and
> + * prepend its own header.

[Severity: Low]
Is this the right description of the has_hsr_header case? The kernel doesn't
seem to prepend its own header when the caller supplies one:

net/hsr/hsr_forward.c:hsr_forward_do() {
    ...
		/* If this TX frame already has a HSR header then forward the
		 * frame with it and don't add one.
		 */
		if (frame->has_hsr_header && frame->skb_std) {
			skb = skb_clone(frame->skb_std, GFP_ATOMIC);
			...
			goto inject_into_stack;
		}
    ...
}

hsr_xmit() also skips source address substitution in that case:

	if (frame->port_rcv->type == HSR_PT_MASTER && !frame->has_hsr_header) {

The fwd_hsr checks in raw_recv() match the kernel, not this comment. They
expect a single HSR tag that carries the caller's own sequence number
(hsr_seq - 1) and the caller's flipped source MAC.

Should the comment say that a supplied HSR header is forwarded unchanged, and
that the device only adds its own header when none was supplied?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-hsr_ptp-v11-0-264c88f4f1d0%40linutronix.de
