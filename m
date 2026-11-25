Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795574411;
	b=pNx6nofn40or6dcJAz4WvcvuhUoFnP9pqN6YL7MYlbfKPS8K4bEbVLM+iTuFSnDN30WQ
	 47qzjzG4KHE+ih9MLKVnBwisq0bbcReSpfN5lOl/dWHob6Npp3ofOzQ7RvylIPOUSZ8sJ
	 mzEULvEeObcsCXnWmMhTXe/DVD9G2LrBXFAv/oR4s5/UIlDhmMtLMIxnMmufsRbhTQJ8/
	 AZk5zHXwQ9es2Q9CqNgkeD8uWTqPcAZeEL5x2W6ReV8ZQgcBg1ce3itaoc28UR7EPru+a
	 G2aS9KfxZpUlC3hPGvHTwU+LDvDAq11yNARk5dVdz2ZHdxg8HWspZ3LBmYbR0J/A6Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795574411;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=2QRp2G+wGJdFdnayUAn4UkhECjTnmy5byUMtpzcdPMg=;
	b=nL1tB3C9rVSgl5XLhcVEANvn2uGIwFF8jrlHiR2UoHHVMrrTMm//EwHeU5OoZNcbW2+f
	 XbDZMgh7iABKQncpcI6O1kGR3yxrpcH/cDmTB/fVrqGAf9hgbglrLgANUYf1cCPRH6pr9
	 wq+lVAA/ET5k0epDsUqDSs54XkLM/02Zi6orX0iu9m+2q3QkWnVUeNvQcpjtv5Wb2LVZ4
	 9T0pw0CiuQnFQ88H9xymvK8xsYEqQsAVxIuOqinV3qqV+5LvLDbsoogTa/lD72QPUBLAd
	 8M1rL06Rc1h41VwkjokXDCkrNuUZz2b8rTnWFGc/Iq028G08DUzZyeyjC/hMH9EFLBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rykkvg+4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7654606A323;
	Wed, 25 Nov 2026 02:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rykkvg+4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85FA61F000CA;
	Wed, 25 Nov 2026 02:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795574410;
	bh=2QRp2G+wGJdFdnayUAn4UkhECjTnmy5byUMtpzcdPMg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Rykkvg+4zJAAyLxQQRAbqKda4N0bB9ssw/Rt9ZYsq8BMqItzs4sSt3TU/gX3JAmhR
	 gHpMe6DKrz2hSc6hVnjSQObndiYswN3ORqst5F1S3NGXrsKNMny0Ln5KeMKAa+yJiX
	 d2ihyAMgb7kYMlNLGN3iZmMlj0hhaCRul4CewMPqEUkqC1Gx7oxxm6QXrOhEPyTGIX
	 GL/tnsX2IkT/cHlvfzOhh75Wme7z4GTk1w7h5hCM7tqvXO3Tz7WR5QP56Ufo+NwKvz
	 dWI35s8xjS/7vRIzuhZogNEudz6kXDqsqA2nkztgPxNwelWqsWwoZG63otzH6EYLt+
	 cUPvU6tP8MStA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7749D3808209;
	Wed, 25 Nov 2026 02:40:10 +0000 (UTC)
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
Subject: Re: [PATCH net-next] net: stmmac: eic7700: Use
 syscon_regmap_lookup_by_phandle_args
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179557440902.178200.2476028983482172628.git-patchwork-notify@kernel.org>
Date: Wed, 25 Nov 2026 02:40:09 +0000
References: <20261121170753.161170-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261121170753.161170-2-krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Willem de Bruijn <willemb@google.com>:

On Sat, 21 Nov 2026 18:07:54 +0100 you wrote:
> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
> syscon_regmap_lookup_by_phandle() combined with getting the syscon
> argument.  Except simpler code this annotates within one line that given
> phandle has arguments, so grepping for code would be easier.
> 
> There is also no real benefit in printing errors of missing individual
> syscon arguments, because this is done just too late: runtime check on
> static/build-time data.  Dtschema and Devicetree bindings offer the
> static/build-time check for this already.  OTOH,
> syscon_regmap_lookup_by_phandle_args() already handles error case if the
> number of arguments is too low, thus switch is safe.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: eic7700: Use syscon_regmap_lookup_by_phandle_args
    https://git.kernel.org/netdev/net-next/c/882f4ba39863

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


