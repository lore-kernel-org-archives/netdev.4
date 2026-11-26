Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704044;
	b=21DjjVzGXbQdzC+m1RnWIDOT14sdIUUzmwL+UfN1Vzo9RLlv5djWbe7AQB8xRwnfOkeS
	 kj6uUQZS3KIoLWRmJAB16x2htIzF0/YqI1T8zzQc2D7MWDGPnxRtkcVCBYJxTF/r/bxr7
	 VIYkHwfMOElMgqnrbtB7iHGHvMPMC35Shx5RyuwhGbZWc25KnO42Ev4dEQik8YMFiMRrV
	 SlkKH8X5vvQoGfr0OVE4kbJLOOHuiW/CnwS7btoevdKcslqWafv00WTSbZyqq3dsGlWri
	 3lelaj5mY2XsfdHdOYi6fpUgMQizb5iUIeguR7XQvO4HsdxAAvkYp/Vb4T5BI6/h4vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704044;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=UgmM/SCvw9ziu/7SxejXSa14xRi84gRk3vDkXvLCaxs=;
	b=iXBT9EtvFXHpkG+ctCts4v18TFQ4O+QHCqWOztprKJmoRunBfwGzRbEZk05c1SkIETvl
	 NtXU75+zPEghjJOT3XKCQ7idhqi5WSPxbQhzdI8KTEiD1c65wf83R6lgYLeMeEVGdJRMo
	 xYgVC85AkZ4nR1vYIRaWVIxP6LHNlLBsyzgrVrw+OVUk/C8gccev87tvyTPXqBakq+oGW
	 6oScfs90KLH24UBFLw4MszpAJoThjLDXmSQVAiEuSKfPTWTkY3XYdFxKh1MwDXLSb2kJN
	 rwobZs2y7wFn8ZUmDuPeZvtlzqKgsZ9F7ha5dUzZoKh2ifZCWOUvNhWUSpb2k/lbP8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cYmU+7nR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA82606A330
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 14:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cYmU+7nR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E14481F000C4;
	Thu, 26 Nov 2026 14:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795704043;
	bh=UgmM/SCvw9ziu/7SxejXSa14xRi84gRk3vDkXvLCaxs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cYmU+7nRt12Iaxvj5SRuCzwiaqmn6Qt2J7UOZhiVdu1wQT4Gp0twaH821tVtXugaL
	 ruyhk9/cxTUYCkK7OfmUADeh8sOMKNpg9PkdctdaynBD9YT2NIUACQwXe4AlN3+vhK
	 //Sz0s9sKzNWbT9nIuo3O8uvt5Ek6SZ3ssjPAFXL35NiJ/ZIyd8f326affkYDD6WZ9
	 ID5uV0FaYH1n/4LY6BdCQWuQrjjEAwa73ddX4GOuvJMNTTs3qwTXeQKfkO2549yCeQ
	 VYlMGLQOuHZWVtwe4IgkhDvPjHmJjBqmI01sFCYPuwab1y0oKR2YD6FZuenoVlp2fe
	 Z/lybh6Hvmdqw==
Subject: Re: [PATCH net-next v12 8/8] selftests: hsr: Add test for the inline
 PTP header on HSR
From: netdev-bot+sashiko@kernel.org
To: bigeasy@linutronix.de
Cc: netdev@vger.kernel.org, j-rameshbabu@ti.com, andrew+netdev@lunn.ch,
 danishanwar@ti.com, d-qiu@ti.com, davem@davemloft.net, fmaurer@redhat.com,
 kuba@kernel.org, neelima@ti.com, pabeni@redhat.com, praneeth@ti.com,
 pratheesh@ti.com, richardcochran@gmail.com, horms@kernel.org, vigneshr@ti.com,
 willemdebruijn.kernel@gmail.com, daniel.machon@microchip.com,
 edumazet@kernel.org
Date: Thu, 26 Nov 2026 14:40:42 +0000
Message-ID: <179570404248.3135.7481792168822818977@kernel.org>
In-Reply-To: <20261125-hsr_ptp-v12-8-9ddd2a73cb90@linutronix.de>
References: <20261125-hsr_ptp-v12-8-9ddd2a73cb90@linutronix.de>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] Two comments in the new test files describe the behaviour
  wrongly.
- [Low] selftests: hsr: presetting ns variables to none breaks setup_ns()
  in hsr_ptp.sh

--

selftests: hsr: Add test for the inline PTP header on HSR

This adds a selftest that sends PTP frames carrying the HSR inline header
(ETH_P_1588) through an HSR device, with and without a supplied HSR header.
It checks that the inline header is stripped and that the frame appears
only on the requested slave port. When an HSR header was supplied, it also
checks that the sequence number and SRC MAC are kept.

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
This isn't a bug, but is "prepend its own header" accurate here? When
has_hsr_header is set, hsr_forward_do() in net/hsr/hsr_forward.c forwards
the supplied header unchanged:

net/hsr/hsr_forward.c:hsr_forward_do() {
    ...
		/* If this TX frame already has a HSR header then forward the
		 * frame with it and don't add one.
		 */
		if (frame->has_hsr_header && frame->skb_std) {
			skb = skb_clone(frame->skb_std, GFP_ATOMIC);
    ...
}

raw_recv() in this file agrees with the kernel rather than with the
comment. It requires the received sequence_nr to equal hsr_seq - 1, and
the SRC MAC (after undoing the 0x21 flip) to match what pkt_send() wrote:

	if (fwd_hsr) {
		if (hsr_hdr->sequence_nr != htons(hsr_seq - 1)) {
		...
		hsr_hdr->src[3] ^= 0x21;
		if (memcmp(hsr_hdr->src, slave_mac_addr, MAC_LEN)) {

Should the comment say that the supplied HSR header is forwarded as is?

The "# HSRv0/1" comment in setup_hsr_interfaces() in hsr_ptp.sh has a
similar issue:

	# HSRv0/1
	ip -net "$ns1" link add name hsr1 type hsr slave1 ns1eth1 \
		slave2 ns1eth2 supervision 45 version "$HSRv" proto 0

The script only calls "setup_hsr_interfaces 1", and raw_recv() rejects
anything that isn't ETH_P_HSR:

	if (hsr_hdr->type != htons(ETH_P_HSR)) {
		printf("Error: Unexpected ether type: 0x%x\n", ntohs(hsr_hdr->type));
		return -1;
	}

With version 0, hsr_fill_tag() (called from hsr_create_tagged_frame())
sets the tag ethertype like this:

	hsr_ethhdr->ethhdr.h_proto = htons(proto_version ?
			ETH_P_HSR : ETH_P_PRP);

As written, the test binary would fail on HSRv0. Could the v0 reference be
dropped from that comment?

[ ... ]

> diff --git a/tools/testing/selftests/net/hsr/hsr_ptp.sh b/tools/testing/selftests/net/hsr/hsr_ptp.sh
> --- /dev/null
> +++ b/tools/testing/selftests/net/hsr/hsr_ptp.sh
> @@ -0,0 +1,111 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +
> +source ./hsr_common.sh
> +
> +optstring="h"
> +usage() {
> +	echo "Usage: $0"
> +}
> +
> +while getopts "$optstring" option;do
> +	case "$option" in
> +	"h")
> +		usage "$0"
> +		exit 0
> +		;;
> +	"?")
> +		usage "$0"
> +		exit 1
> +		;;
> +esac
> +done
> +
> +setup_hsr_interfaces()
> +{
> +	local HSRv="$1"
> +
> +	echo "INFO: Preparing interfaces for HSRv${HSRv}."
> +# Three HSR nodes. Each node has one link to each of its neighbour, two links in total.
> +
> +#    ns1eth1 ----- ns2eth1
> +#      hsr1         hsr2
> +#    ns1eth2       ns2eth2
> +#       |            |
> +#    ns3eth1      ns3eth2
> +#           \    /
> +#            hsr3
> +#
> +	# Interfaces
> +	ip link add ns1eth1 netns "$ns1" type veth peer name ns2eth1 netns "$ns2"
> +	ip link add ns1eth2 netns "$ns1" type veth peer name ns3eth1 netns "$ns3"
> +	ip link add ns3eth2 netns "$ns3" type veth peer name ns2eth2 netns "$ns2"
> +
> +	# HSRv0/1
> +	ip -net "$ns1" link add name hsr1 type hsr slave1 ns1eth1 \
> +		slave2 ns1eth2 supervision 45 version "$HSRv" proto 0
> +	ip -net "$ns2" link add name hsr2 type hsr slave1 ns2eth1 \
> +		slave2 ns2eth2 supervision 45 version "$HSRv" proto 0
> +	ip -net "$ns3" link add name hsr3 type hsr slave1 ns3eth1 \
> +		slave2 ns3eth2 supervision 45 version "$HSRv" proto 0
> +
> +	# IP for HSR
> +	ip -net "$ns1" addr add 100.64.0.1/24 dev hsr1
> +	ip -net "$ns1" addr add dead:beef:0::1/64 dev hsr1 nodad
> +	ip -net "$ns2" addr add 100.64.0.2/24 dev hsr2
> +	ip -net "$ns2" addr add dead:beef:0::2/64 dev hsr2 nodad
> +	ip -net "$ns3" addr add 100.64.0.3/24 dev hsr3
> +	ip -net "$ns3" addr add dead:beef:0::3/64 dev hsr3 nodad
> +
> +	ip -net "$ns1" link set address 00:11:22:00:01:01 dev ns1eth1
> +	ip -net "$ns1" link set address 00:11:22:00:01:02 dev ns1eth2
> +
> +	ip -net "$ns2" link set address 00:11:22:00:02:01 dev ns2eth1
> +	ip -net "$ns2" link set address 00:11:22:00:02:02 dev ns2eth2
> +
> +	ip -net "$ns3" link set address 00:11:22:00:03:01 dev ns3eth1
> +	ip -net "$ns3" link set address 00:11:22:00:03:02 dev ns3eth2
> +
> +	# All Links up
> +	ip -net "$ns1" link set ns1eth1 up
> +	ip -net "$ns1" link set ns1eth2 up
> +	ip -net "$ns1" link set hsr1 up
> +
> +	ip -net "$ns2" link set ns2eth1 up
> +	ip -net "$ns2" link set ns2eth2 up
> +	ip -net "$ns2" link set hsr2 up
> +
> +	ip -net "$ns3" link set ns3eth1 up
> +	ip -net "$ns3" link set ns3eth2 up
> +	ip -net "$ns3" link set hsr3 up
> +}
> +
> +run_ptp_hdr_tests()
> +{
> +	echo "INFO: Running PTP-header tests."
> +
> +	ip netns exec "$ns1" ./hsr_ptp_test -H hsr1 -A ns1eth1 -B ns1eth2
> +	ret=$?
> +	stop_if_error "PTP header test failed (ns1)."
> +
> +	ip netns exec "$ns2" ./hsr_ptp_test -H hsr2 -A ns2eth1 -B ns2eth2
> +	ret=$?
> +	stop_if_error "PTP header test failed (ns2)."
> +
> +	ip netns exec "$ns3" ./hsr_ptp_test -H hsr3 -A ns3eth1 -B ns3eth2
> +	ret=$?
> +	stop_if_error "PTP header test failed (ns3)."
> +}
> +
> +check_prerequisites
> +trap cleanup_all_ns EXIT
> +
> +ns1="none"
> +ns2="none"
> +ns3="none"
> +
> +setup_ns ns1 ns2 ns3
> +setup_hsr_interfaces 1
> +run_ptp_hdr_tests
> +
> +exit $ret

[Severity: Low]
Do these presets stop setup_ns() from working as intended? In
tools/testing/selftests/net/lib.sh, setup_ns() only generates a unique
name such as ns1-XXXXXX when the named variable is empty. If the
variable already holds a value, it calls cleanup_ns() on that value and
then runs ip netns add with the same value.

ns1, ns2 and ns3 all hold "none" here. The first iteration creates a
namespace literally named none. The second and third iterations delete
and recreate that same namespace, and all three variables are left as
"none".

setup_hsr_interfaces() then puts all six veth ends and hsr1, hsr2 and
hsr3, with their overlapping 100.64.0.0/24 and dead:beef::/64 subnets,
into that one namespace. The three node ring drawn in the comment is
never built, and run_ptp_hdr_tests() runs hsr_ptp_test three times in
the same namespace. The test can still pass, but it is no longer
checking the topology it describes.

There are two smaller effects:

- A namespace already called none on the host is deleted.
- NS_LIST ends up holding none three times, so cleanup_all_ns() tries
  to remove the same namespace three times on exit.

cleanup_all_ns() only walks NS_LIST, so the presets do not seem to be
needed for the EXIT trap. Can the three assignments simply be dropped,
or set to empty strings, so setup_ns() picks unique names?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125-hsr_ptp-v12-0-9ddd2a73cb90%40linutronix.de
