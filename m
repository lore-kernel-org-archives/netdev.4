Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620615;
	b=Lvv4edQ8Df1dBirGoD3EPcx5d1CSKdaA2ESjLQ3roO6uM2PNmbs0A6fGCU7Sk99z/hK8
	 S9XebOkkU8wAYvzESDbnaPaB8kploeq2l9KB6aXPUaCoaksKqZx0uaSA0JrOkaEJUFxh+
	 5ruRPINigovPd4dgVzJRBVnHrBdCY98C4kvSupkSAY/6d7uUZYe6jkrCVNMw4jTgBVeQX
	 Do9OC6Qfgn6yusEHKShpJIpZmPwUJa4YvxF2PzlbAL0YNBjHbM/n05iH/1WvADxl9XnsV
	 Q4VRtJKiv5B6RgORyEzgpmaoRBaS9ZXtBCCJ6mTQjzBEIgNApTghKAVOx0LbmyqCSaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620615;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=YPoCqSchukPk/6/Q0GhtP4g/d4Rfs7HULyummTBWQ3o=;
	b=bTm2BXUUOgxlmQ5QUqFuKjVVOVcsJE6yLPsbGE02OIzdHNjN/9Sjm/p/9jJ/K+xgBLcK
	 oJrH+EJFFRpHPshb/ERspXCLktvwq3Jius9IQp7yQyaTL7XstNvUz1d1P+WdBsh2JyTP9
	 IbhhmEwMfLIaQfcgSJ6+rPDjaH/vgtZ2laUsv3EmrbqbMbVmaNrj5EOtq1oxDyIsGhRs9
	 Ze+pT+CKbb2hFdHAbJK4ny2WOKrvpR2lhGh09DtTbz1n6PoD+3d4NpkpK41djojustamg
	 aWMRRdk39cfE0gqkB8YDyLxQnwzlC5ha8955fICb/4huiTiNDQhMidViwPYEkN3lYIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dkObNx2z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC044606A327;
	Wed, 25 Nov 2026 15:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dkObNx2z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 700DC1F000D3;
	Wed, 25 Nov 2026 15:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795620615;
	bh=YPoCqSchukPk/6/Q0GhtP4g/d4Rfs7HULyummTBWQ3o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=dkObNx2zcPTd3f9rFQBRt5WG4mZDje4dmjArFxz5CcLHc90Gw9zeuBJF4r9hjQG4p
	 LN4Tgq9wIOHnNZ0QzVUOcaG+s138T24qQ7ezTsZ2Yja+ut7WPFvUngm8xj0ly0Vl8Z
	 cOQVJVTZBSsZieXaYbVBsEFDVpmJJZ/X9PGhFGQD/qUDk7/M2CpOCbwQN7MIemo2Sm
	 TVMfpKCHVQh1PDFPNKJQ8HV4/C6SXRFzm2Z7Nu0YiSOoIu5myNjCEIitESKr8oizLc
	 PlwaoVs8w3iOmdg78956KfMeV2c+OtJ2cuDkytTdMAeamdQgWsw6puT/OEmsVFSbY/
	 T5XEEM0eIUBrA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 67C1A3808209;
	Wed, 25 Nov 2026 15:30:15 +0000 (UTC)
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
Subject: Re: [PATCH net] net: dsa: felix: fix NULL pointer dereference in
 felix_port_enable()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179562061426.619539.1681509079424527727.git-patchwork-notify@kernel.org>
Date: Wed, 25 Nov 2026 15:30:14 +0000
References: <20261119100710.129379-1-aristo.chen@canonical.com>
In-Reply-To: <20261119100710.129379-1-aristo.chen@canonical.com>
To: Aristo Chen <aristo.chen@canonical.com>
Cc: vladimir.oltean@nxp.com, UNGLinuxDriver@microchip.com, andrew@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 19 Nov 2026 10:07:10 +0000 you wrote:
> DSA registers the user ports in dsa_tree_setup_ports() before it sets
> conduit->dsa_ptr in dsa_tree_setup_conduit(). On teardown, it clears
> conduit->dsa_ptr in dsa_tree_teardown_conduit() before
> dsa_tree_teardown_ports() removes the user ports. RTNL is not held
> across either pair of steps, so user space can open a user port while
> conduit->dsa_ptr is NULL.
> 
> [...]

Here is the summary with links:
  - [net] net: dsa: felix: fix NULL pointer dereference in felix_port_enable()
    https://git.kernel.org/netdev/net/c/469b61e4be88

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


