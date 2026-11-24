Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483931;
	b=qFQEPXzx/JK3XhAlUxh3YBBuJ+ghPfJcocBRUxA6indbk0ghkjNc6Ud1+A3zSJboAFxE
	 qgufFR2yA6dq5cLgCdBxQEKokcLiDxTEpzUqb9RpNcglIw9gzR1Pox3R2z3ONjKM0oQU2
	 hi2lNPLKSNPQ0R5YNRdTCegwNQ8B+LUIMmQeCUqjle3nDb8yWz4MBUQzJqJTnyGZxujOS
	 Ch5X8ptzbtrsaamfzXNVflNjHHtoiVWxV+ZQeh8H80d20dHx6PxJ9+2+3WSyufhHHQL+5
	 ZT2LIumx7mttY+PC62+ntLy4+zaNpTwxwmPEBWwsY+cIE2PQJJTSzQqU/l/ZE+JynYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483931;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=DXlOmlmxKZLAkagXzw74NiSKxdqa+vwVh+OnB+/BACM=;
	b=qRbAvKwDt4uDfTROD60l3HHiTS30wuNhh/owdqn4JZBbSetmu0H/FDf6MObpMCbkB6rR
	 7Or/GrfUER0+IIcI5W/LHWaeQwMLwsOXjX93KWD0CUvUUJWPlIsKWznCN/X6NAmxFGAcZ
	 ckvZvWCBi5gD+6vVKPdL0t++jx9QWKzy2q+49jJoPPimhXcqy8Rl4KFR1gU0QBQdFeeRK
	 NcTqoykYr0nWhRGmGcXn+XdVSEm3SIJdrHw4pTdqvZludc4MKSayLx1mIG75f3nTEa9FS
	 uBKqINyDLBpHQiNeo//nNyxCGtsoMGATvMs8F+XnGW7GHE37J4mgF4SvbLwz8S0OBxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MCeFt0Ur;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF75606A691
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 01:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MCeFt0Ur
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D03C11F000C0;
	Tue, 24 Nov 2026 01:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795483931;
	bh=DXlOmlmxKZLAkagXzw74NiSKxdqa+vwVh+OnB+/BACM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=MCeFt0Uraqh/LGe8aptARqG7zC6TLl4UnR9O6ADmQ5TJ9W0Fx9Brp4hnMhil8qqlt
	 Y8q3pCsjmmCuYp0yzdUtTFTubutHMshx0UBapnYcUk2iVANgPx5Mtrabv8AvPdIUG2
	 UodUf8kEPidLGFmc8WBKuTkvtsOGU5EaFa9Gphygu5553WbXPwunsk7ZKKq4Y0zdz8
	 JT+Loz26sBG7OEl+sjFoypFOgX6GjOHAgzumAAYZUc6t5I2Y5y2R6C0feCEkJIcnBt
	 RDmfwP9mR7TK62V7Db4zxt6bwsdBaFi9iFZe/nVUYHQ9JJFgEZgl35rx4lkmDHlkp6
	 D3WNo+GohCwDQ==
Date: Mon, 23 Nov 2026 17:32:10 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: netdev@vger.kernel.org, magnus.karlsson@intel.com, stfomichev@gmail.com,
 pabeni@redhat.com, tushar.vyavahare@intel.com, kerneljasonxing@gmail.com,
 bjorn@kernel.org
Subject: Re: [PATCH v5 net-next 13/13] selftests: xsk: document generic and
 hardware endpoint runs
Message-ID: <20261123173210.1cbcb9dd@kernel.org>
In-Reply-To: <20261119164636.1071385-14-maciej.fijalkowski@intel.com>
References: <20261119164636.1071385-1-maciej.fijalkowski@intel.com>
	<20261119164636.1071385-14-maciej.fijalkowski@intel.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Nov 2026 17:46:36 +0100 Maciej Fijalkowski wrote:
> +``xsk.py`` starts one ``xskxceiver`` process on the local interface and
> +one on the remote interface for each case, and owns the TAP results. It
> +starts the local endpoint first. That one listens on a TCP control port
> +(``--listen``) on the local address, and the remote endpoint connects to
> +it over the tested link. The listener reports on ``KSFT_READY_FD`` once it
> +listens, so ``xsk.py`` starts the remote endpoint without polling for the
> +port. The listener waits 10 seconds for its peer. 

This README is a pile of auto-generated slop. This is how most two-host
tests work :/ Please trim the doc down just to what is unusual about the
test. And preferably load that up into the doc section of the Python
file (at the top)? We plan / hope / dream of rendering the python
docstrings as "test information" somewhere on the web.. one day..
