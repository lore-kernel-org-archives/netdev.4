Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459595;
	b=2JACWFoWjfkcfLNETBeZgOqP0WPXYMwdKpaiuXVxRKtvLXVNY8TjtTiAcNxe1N6rzzai
	 ih/I0Xo7ZAFFJZ5S1pr3XgxocO2BV6gZgSjx2gWkPufkKHDY+LihVnIhuf2LIv7E3bHc1
	 VH2OU5qGfJnHu2pCVcdum0i41lgnknp32B0gPc9Z/gDBdY2+fQ7/T9IyBPD8eQSNSYaKc
	 t9iI6CWm71Yl2gNWdf97qpA6NcH0eAtLDGVxzfgdSJAc8uuHIl/vVIqiFu45wofuWAOdp
	 PxvgM3cQOT1LGAEcQWDGu6URXanr+KzFUpZ9z4b3efquF4MwaFAJ+RNcGVjfQOVOf/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459595;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Bkb0N53UI7VBpm+nTdtNNJG0XnBjw0Wvm9W/e9w13+Y=;
	b=MOBn3T9SmhAZI1OOlScZE0rVO0IltLISD+LYccVI7gH3RlwrTrmWI+hH4RpuvtEslYul
	 9rZB5XE2ZsJlzkJXH1VzyyGXivlWIgbW2J31mU2TNODZCYsU0ivsxZdtVR7bJQqXxeU9v
	 xKgWWWC+8ZPjbxkHELccmT1EAsqcI72b7BNmIG9WAhqNPXDjo7ySDpJGwyWlJELSxobKN
	 IeHhTXFWQQhEBkSFzUuH3JfgLSk2GYI6XQZGzDmw4r3CDJxzrz/kmLPDVg/Ne8zX41alr
	 XPwayNJNAyOR6KSa+wX9iXWdWyg5TBiL2d9BHgZaQwCplKWEAC9b8ZQUxP3UMSoQsjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BNQfX4Mx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D3F606A333
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BNQfX4Mx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E20A1F000C4;
	Mon, 23 Nov 2026 18:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459594;
	bh=Bkb0N53UI7VBpm+nTdtNNJG0XnBjw0Wvm9W/e9w13+Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BNQfX4Mx5HWRBo/mSVupQpWPRvhYZ3XrVrrI9N4pkskVYv4GGmv7SHy948801Uuok
	 ICkdvaWQIdjVejjxs3l/wv3l9k0X/s5Ld23oblmQQc6xo0C6+hdkHyZzT4mBYyjSzE
	 Yx+zz6YlvKrjya9CvhG9FezlPfmL/Nn5oOe+orlgj9HMO9CuOesg5n3+JK3dil/BOL
	 tU20ytBR7m032suOSzO737eoGxxK5jnia0NT87Rayj8FFD64cPgXdWr3aSBz38foFr
	 1Ci7y9eiI+oJD5F+exC5qKB66rbTtyi5Gd70G8SP1svY5oWoCX7Slmapwo9WbnQ4Po
	 S3fr3qZxdid4g==
Subject: Re: [PATCH v5 net-next 05/13] selftests: xsk: split xskxceiver main()
 into setup, run and cleanup
From: netdev-bot+sashiko@kernel.org
To: maciej.fijalkowski@intel.com
Cc: netdev@vger.kernel.org, magnus.karlsson@intel.com, stfomichev@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, tushar.vyavahare@intel.com,
 kerneljasonxing@gmail.com, bjorn@kernel.org
Date: Mon, 23 Nov 2026 18:46:34 +0000
Message-ID: <179545959409.3135.16751084893051998673@kernel.org>
In-Reply-To: <20261119164636.1071385-6-maciej.fijalkowski@intel.com>
References: <20261119164636.1071385-6-maciej.fijalkowski@intel.com>
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

- [Low] cleanup_iface() in
  tools/testing/selftests/net/lib/xsk/xskxceiver.c decides whether to…

--

selftests: xsk: split xskxceiver main() into setup, run and cleanup

This commit restructures xskxceiver main() into separate setup, run and
cleanup steps, in preparation for running one endpoint per process. It
adds bind_iface(), detect_mode_caps(), mode_supported() and
cleanup_iface(), and makes run_pkt_test() return its result. It also
calls ksft_print_header() right after the command line is parsed.

> diff --git a/tools/testing/selftests/net/lib/xsk/xskxceiver.c b/tools/testing/selftests/net/lib/xsk/xskxceiver.c
> index d82224a4fa4b0..97eece4c57f89 100644
> --- a/tools/testing/selftests/net/lib/xsk/xskxceiver.c
> +++ b/tools/testing/selftests/net/lib/xsk/xskxceiver.c

[ ... ]

> +static void cleanup_iface(struct ifobject *ifobj)
> +{
> +	if (ifobj->xdp_prog)
> +		xsk_detach_xdp_program(ifobj->ifindex,
> +				       mode_to_xdp_flags(ifobj->mode));
> +	xsk_unload_xdp_programs(ifobj);
>  }

[Severity: Low]
Can a DRV mode program stay attached to the netdev after xskxceiver exits?

cleanup_iface() only uses ifobj->xdp_prog and ifobj->mode to decide
whether to detach and which flags to pass. xsk_reattach_xdp() in
test_xsk.c attaches the program first and updates those fields only after
the DRV mode check passes:

tools/testing/selftests/net/lib/xsk/test_xsk.c:xsk_reattach_xdp() {
    ...
	err = xsk_attach_xdp_program(xdp_prog, ifobj->ifindex, mode_to_xdp_flags(mode));
	if (err) {
		...
	}

	if (ifobj->mode != mode && (mode == TEST_MODE_DRV || mode == TEST_MODE_ZC))
		if (!xsk_is_in_mode(ifobj->ifindex, XDP_FLAGS_DRV_MODE)) {
			ksft_print_msg("ERROR: XDP prog not in DRV mode\n");
			return -EINVAL;
		}

	ifobj->xdp_prog = xdp_prog;
	ifobj->xskmap = xskmap;
	ifobj->mode = mode;
    ...
}

If the attach succeeds but xsk_is_in_mode() returns false, for example
because bpf_xdp_query() fails, the program stays attached in native mode
and the bookkeeping is never updated.

On a first attach, ifobj->xdp_prog is still NULL, so cleanup_iface()
skips the detach. If the interface was in SKB mode before,
cleanup_iface() detaches with XDP_FLAGS_SKB_MODE, which leaves the
native program in place.

Because bpf_xdp_attach() is a netlink attach, the program outlives the
process. The commit message says cleanup_iface() "copes with partially
initialized objects" and takes flags "so that they match the attach".
This partial attach state doesn't seem to be covered by either.

The same code is still there at the end of the series. Each process then
runs a single test, so no later reattach in that process can correct the
fields.

Would it make sense to record the program and mode in ifobj right after
xsk_attach_xdp_program() succeeds, or to detach with the requested flags
on that error path?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119164636.1071385-1-maciej.fijalkowski%40intel.com
