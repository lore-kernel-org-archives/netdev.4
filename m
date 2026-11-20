Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135449;
	b=YnGNNut67rkIdS0tvgPHSksX6ccSs3y+fO7+cUbXTIDxeEFRni6u0u+pgE0BBlNoJVO2
	 xHUkOTCB6Bdw8Zw+weMc2p8RLWtO8gZnq1jcGsiIagrc8yCO1N4WyRX/9XdDkxMBkl9FN
	 2YhFMxgylbFnHj3rx5id8e3s12EOLo+hbuhuMCokuwnHi2/KSay2egAyp8Dld/IPbmtpD
	 d741AuUbRX+w2z8FawOzAHfme41hnCNCF7J/HkR3Xx5GcLnCJ/93kNZztPINub0b4Tq09
	 jZH7FKdb8RePFKCHZAkuguPQedcAMiy+WSID3Imq2rX76Jl5SRkH3ID0xDg0KYntMnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135449;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=gI/HAxY3WhDAs8lNFwumSDS3oIINRL9PydS8G9/9+aA=;
	b=dpk+H6gC3Uv/PEpGjToAhCyrRn93CSpHNoyfwQisHoKCD/Pa3nczAbIMUtmy3vYMNXrm
	 BMwKzYkmqzClEWhDLXEk5SmqzzTVx7FoZf6itJPnEoiVWy6dioLAGFbm0bfz4k4lZV1wI
	 rF15CFlyXsBJd5XvdwW3mEj1Q4Pdw8DZTvSWp/+WZxELiKyBf6vqrCKmdEm1OnYlFRrGH
	 EHsaW7icr50kgo6F5U1Z3kQsty2SWiD3h8EBoMYFvy/e7WXYVFxkwU+vXBRW0UCzFLA1W
	 R79DEhtdyt2ie6xRj+Y7fDLr1QW45XQEV3bqrzp7rpFCuPv4KI1ryYHjy/p3mJkiQNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KiPY5lGS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DA8606A325;
	Fri, 20 Nov 2026 00:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KiPY5lGS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 883861F000C6;
	Fri, 20 Nov 2026 00:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795135449;
	bh=gI/HAxY3WhDAs8lNFwumSDS3oIINRL9PydS8G9/9+aA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=KiPY5lGSR9qj9vmXhooEstVBQhgrSk9V/3CeriRzXMiT/Y24jYpyCcu7R5Rgycral
	 NX4otO2a9ZoqnQzn0wx2kLd528js/ER4ZBhM50kutybLjb5dnsziVFlCrgoLj+ATlz
	 bncrGZhW5H9+vaHzytaXf4MT9CegtRxynrS5Y+OHxKnf2kxIb+Uk20cicwwCQKKOi2
	 AWNCg3fG7w50Jp3lZV8YQcfY4C+hH/w8A9DOOmL1iT2ljWdiVy7ufJSKEehiDelB0V
	 bbUfEdKnlBVhnqOrHRW0otsUKoAJv9s0YjtESLo8Bryj7Dafs4xMMGtLxn3riVGEuM
	 Epyh4IX8npE1A==
Date: Thu, 19 Nov 2026 16:44:07 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: <diogo.ivo@siemens.com>, <haokexin@gmail.com>,
 <philippe.schenker@impulsing.ch>, <devnexen@gmail.com>, <horms@kernel.org>,
 <jacob.e.keller@intel.com>, <pabeni@redhat.com>, <edumazet@kernel.org>,
 <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, Vignesh Raghavendra
 <vigneshr@ti.com>, <danishanwar@ti.com>
Subject: Re: [PATCH net v3 RESEND 0/3] Fix switch mode for offload and
 non-offload cases
Message-ID: <20261119164407.1d2b3fa2@kernel.org>
In-Reply-To: <20261112102140.2744508-1-m-malladi@ti.com>
References: <20261112102140.2744508-1-m-malladi@ti.com>
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

On Thu, 12 Nov 2026 15:51:37 +0530 Meghana Malladi wrote:
> v2: https://lore.kernel.org/all/20261027131732.3411403-1-m-malladi@ti.com/

What changed in v3? When was v3 posted (since this is a repost?)
You are expected to reply to the sashiko review, even if just
to confirm that it's correct.
-- 
pw-bot: cr
