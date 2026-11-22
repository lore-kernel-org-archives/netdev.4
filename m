Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795308007;
	b=KNJGGib41caqmcxcxFhdNhUfqAoc4MXDuLPfPe/0ITjuF5xFGbEhhQcHHTSJoOjjdKqn
	 AJk0jhXpYwt3FX3QpZ1eCxRM9Wtb5RhZff++B8n0E00z9QVM+MNQZ7z66F4H+oR6jK9t5
	 D7fs8TLL5gMich9mPUdlqTExZXgqMzc6MVYpOMV9N1+VyASYspZuZhaTTizfCCVa0bw0U
	 SmQxzqjd55FS19cdfL8wQxC66bymtZgE0ZA9i0thP2xNzR4IFFEwHiXggmnOx8CIgHrep
	 uxDZrJh4tP2yRQrlXwlrGkFygU/YKh4/tXERQA0bpiaLkQ43N9t0MtM6wMCSmD2sK8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795308007;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=knHRBkkg8nivEx/FCnwzI+5mRaYmVa1KoeTkUKDN6as=;
	b=yPCzVfNvOrWRiEw2Qn6d/2gHUsb+qKX3pUlEfQlPqpt3Y/PjQqWYb6h5IbOa9CJY4U7O
	 RotBvl0zBI93S+vf4uUyguQSHRcRYSSwb1Ukw+8GfCmqhj/8Y/nzeWuu+VkxPclqX6yH4
	 w7bGxCvxcMMYmpSnANtpIf6DMjF2u30U4qmKgXcKx5RdU/zG8phy4OzHJ+P4RnPT1h4So
	 dO4kdo6rdAJXkADpre40iY0+ID+RlV4jvsZY3qj+6jGkjnts5avFeyhMh5a/9D4AZoYam
	 7wAc0ue/v5rEsn+WMweCUSR+0uG0jabVz6/EJXPIpw0TplaNvEHKOmK2bAeDhkHqKPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="G+o9/JJr";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCB2606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 00:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G+o9/JJr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE2931F000C4;
	Sun, 22 Nov 2026 00:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795308006;
	bh=knHRBkkg8nivEx/FCnwzI+5mRaYmVa1KoeTkUKDN6as=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=G+o9/JJrGOu+S39DITo7boR0+1z9vFKDRExxnirsU53mW3piGXy6kw7rZTsy0FqUS
	 cNEntERgp+SDyCoXfTS+IwuvwnBiOwOPFD3Dxrd/0Iw9Pr891sWI8IidLNv7C1H4nG
	 XHqLPoTZ/eVEr4c9EYR8HKJNTgcjRJTZLCZAwgsFgvqRQ1tnPLYTqoa/2ro4JKJtT0
	 OIWB0bSxd0AbhYpF6hePB4BIwrQbgThkc0UNla9b17E/aI9U9P+mopigSqdF7gTA4B
	 n1irWhPHJ4NQZWcMmel5iA/t+Zfl+9dd301CSewr4BW1JqLgXcg7NONwWvdmxaYLM9
	 WKW5qFBXoOUUw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44B4391B098;
	Sun, 22 Nov 2026 00:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
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
Subject: Re: [PATCH net 0/6][pull request] Intel Wired LAN Driver Updates
 2026-11-13 (ice)
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179530800553.1234840.3130434882992337431.git-patchwork-notify@kernel.org>
Date: Sun, 22 Nov 2026 00:40:05 +0000
References: <20261113231225.1864810-1-anthony.l.nguyen@intel.com>
In-Reply-To: <20261113231225.1864810-1-anthony.l.nguyen@intel.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@kernel.org, andrew+netdev@lunn.ch, netdev@vger.kernel.org,
 michal.swiatkowski@linux.intel.com, poros@redhat.com,
 david.m.ertman@intel.com, pengpeng@iscas.ac.cn, przemyslaw.kitszel@intel.com

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 13 Nov 2026 15:12:17 -0800 you wrote:
> Michal Swiatkowski fixes TC to-queue offload for non-PF0 by switching to
> use of global queue indexes.
> 
> Petr Oros resolves a couple of promiscuous uplink default VSI Rx rule
> issues; avoiding redundant per-VLAN rules and preserving the uplink's
> default Rx rule. He also fixes an off-by-one read issue for devlink NVM
> read.
> 
> [...]

Here is the summary with links:
  - [net,1/6] ice: use global queue index in TC to-queue offload
    https://git.kernel.org/netdev/net/c/9175e1d6d2f0
  - [net,2/6] ice: skip per-VLAN promisc rules when default VSI Rx rule is set
    (no matching commit)
  - [net,3/6] ice: preserve uplink DFLT Rx rule on switchdev release
    (no matching commit)
  - [net,4/6] ice: Fix incorrect LLDP filter assumptions
    (no matching commit)
  - [net,5/6] ice: propagate ETH56G deskew poll failures
    (no matching commit)
  - [net,6/6] ice: allow reading the last byte of the NVM and Shadow RAM regions
    https://git.kernel.org/netdev/net/c/dc84cae413bd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


