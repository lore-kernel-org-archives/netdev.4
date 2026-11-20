Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795141817;
	b=qn6Tqpd3czTX5R5u+d+c0o5Dq4zsrWXdjtGTrqHNEmN2aVEaebf3TJeaMT9PoFLs9o3z
	 fb3atuiDOVgTUDoI6QTum/B3nBjH7q4wg8WnTnNgUsnPHPRbXiij/gDNUTuGRrL0PBIW8
	 N3ifzgg0utaWg974BdhJ9ax+99RBxHsmj/fmzHSgjRzh8+uB8evBV8nTlgN6wy0rE/nVO
	 rS6H4+q+1q6QC1VjO1vGJUcNrj+uDux8ru6bOs97BWGTKDrkSU/6Lzf0WtEFSn6TG4mDs
	 2RRZSYO3sqCRuV8ABrzKAXyuBF5XwNsV4rikYelZmNloJHVwN19MV5aEdUshhrj+agQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141817;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=Bsko40UArMhlk8jXOxQgPgbPinBdDj0CN2tdfTyhCls=;
	b=x+TAdnq1DJ5xMxnPaGZrSCoyhdlTJAHKGUJfNA+/p9MpDUkJ6fdlDK6Gu+Xy8QD3nrXu
	 xYTdIH2028cEUhjCiwvLYFH0+PpRes1lTy6sp0UoMYPqw7OsxjQR3qa1N5ZSYsnuvdy8m
	 COXiZaUIiXN0mFQDwXqC89SKBTF9X04DVxvldkknTk9JdTiTGqNrYmmZTuQ6QZPZbheiF
	 3cBG8CWC3WkKAUwDzKHP/uAfky6UredU5sZeThkfEZKZG5nM5gzMyrAxw/0ow1wINJjJs
	 yh37yD0Xb9Huy5lhOFiOAsGXsLhoYM1HIMIUG2xcA87rZVgrT+5JxXFqcoI2Nc3eY6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="lZ/XNZ02";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A4260A2616;
	Fri, 20 Nov 2026 02:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lZ/XNZ02
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF971F000E6;
	Fri, 20 Nov 2026 02:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795141817;
	bh=Bsko40UArMhlk8jXOxQgPgbPinBdDj0CN2tdfTyhCls=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=lZ/XNZ02cGRdPSBoNx6MIeKoPz9WrzYL2btOTaVxafCD9BMURKt30md6J46dxre85
	 /ChU485UxHQcEk4o1coAacgZ02026UPwt2klAbqxlXxZtUBcOY8Qw0HAOJuXSceByC
	 rw+/RoBtRwdMVghPcKDfJ4HAoyoigQ3osRlV6tkBSiY2I0KBzdJEqVEFKVrGHm/szp
	 ukeLDHb0AiNB+1yaADX3ZNLzkGZpB+Nh+zWUwtB+3fE7DSplI3HAw8cX9HCW/9X8Fz
	 wsc7cOaPeDR3fp9DNVztyI7Y5zSr3m2cMW2Hj4X9VMqj1UsD/OarcAddqSBbREV3a9
	 FbMI6qamGbodg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7743A3808209;
	Fri, 20 Nov 2026 02:30:17 +0000 (UTC)
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
Subject: Re: [PATCH net-next v1] net: pcs: xpcs: add 10000baseCR_Full to
 10GBASE-R
 link modes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179514181602.3985754.15557680920042942739.git-patchwork-notify@kernel.org>
Date: Fri, 20 Nov 2026 02:30:16 +0000
References: <20261116101644.83097-1-francesco@dolcini.it>
In-Reply-To: <20261116101644.83097-1-francesco@dolcini.it>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 francesco.dolcini@toradex.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Nov 2026 11:16:44 +0100 you wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> An SFP+ direct attach cable is reported by the SFP layer as
> 10000baseCR_Full, and this link mode is missing from the 10GBASE-R
> supported list, therefore xpcs_validate() masks it away and the
> 10GBASE-R interface cannot be used with such a cable.
> 
> [...]

Here is the summary with links:
  - [net-next,v1] net: pcs: xpcs: add 10000baseCR_Full to 10GBASE-R link modes
    https://git.kernel.org/netdev/net-next/c/0742ef27cd72

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


