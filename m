Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166181;
	b=mZRUufHd5JI4Zpkok4Ak+te82TA3JapLV20aZwMvJ4CyPZuHr3QptpXu3NKQKdOlMDvG
	 jWolF1dzE/UrN888K+SxP2hUVcsX/aLKWGDyeWIlpoTuBgNBU2xU5aX3Ax12YdvBNs/6A
	 PSfSWGZ3KtBkCm+RIz8pU94ThbDPox+iwXLsrkZcLx1HiIq5qzNFfs44GSmnrLcf63LsP
	 Gv7l5+Va4Mk49noyCZKku50QkWalwOwtP2SdqFBxZQhnXzm0Xuo62xBBgMuD4e2bUDQeV
	 MmdnBiiqiD2T/WgVzCX/ZaVnhrnZUr+ccJxc1KB2Q4FloLmdeKqLNTJhFMIC/k7KFeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166181;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:From:To:Cc:References:Autocrypt:Organization:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=XNsSUu++wCLCWqUdBI3bSKbsGASev+/eqe6+SJtDH3o=;
	b=jbJteCA0E0s6SXcdhfYcqrnOPAtdotLlWi6xAiFavpLn51zhVscrGkM9pjavk7/8Jow3
	 xG3Fnnh794J2lzzBTO/m55L0oisuH25IB60XzUN4Vlh9D1UHRVebaj22eC9DcboXZ4gmi
	 hBUtl+FsTW7ojFneXRF1cgXnqKeq1z4F0qFMwu6jtgEgherlPW4WUgIBjoRy67VsLbxTA
	 0JlsytG5iI7gE2rV3OATmdf5MYxpBoxN8ml2XpOY6jq4kevnqaajNMSS5f6HGsUbkQCU4
	 m8ugJc5pwbIv9GBMlz3kFzUn+drhQ+ydWwA1WN7/6exIzUEt26yRMmLB0BOlLmgFYsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b+eNbgAq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA790606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b+eNbgAq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73BA81F000C6;
	Fri, 20 Nov 2026 09:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795166181;
	bh=XNsSUu++wCLCWqUdBI3bSKbsGASev+/eqe6+SJtDH3o=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=b+eNbgAqNaOCTlhE8UX4t1S905MiVFWDjYUIQWjV3TTvl+TBqRQ0yrVp94x0uWfto
	 CpGBZGupe4J8zy2KNGBaU2gWNVEWOBdcd3JvZywbbL5m/4MfxjzcvccErLOXHBh3Ww
	 Jik+KybLHhwTW2HXkNZyYY5cyzE7qYkfi5KCCPW9TNn/VWYYCubARdM7apRIcOONr0
	 S1lfUFGly9LYrVbx/o9V4uAEz8YltONapTjd/a+HUQUMbvrYcSaYD+v1cgJTMQzfhl
	 ASfI2n0zLKXbH1tmjC46dZdhn/FkpyXRAcF/YJl1MSKqnrhOaPrHHWdgOoQ5ppuwOJ
	 4XFGin1g/3E+g==
Message-ID: <2acf8e3c-9f9b-4784-afaa-9cc0e78c893b@kernel.org>
Date: Fri, 20 Nov 2026 10:16:16 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [TEST] Collabora's Netdev-CI: missing results
Content-Language: fr
From: Matthieu Baerts <matttbe@kernel.org>
To: Gustavo Padovan <gus@collabora.com>
Cc: Netdev <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Aurelien Aptel <aaptel@nvidia.com>, Shai Malin <smalin@nvidia.com>,
 Boris Pismenny <borisp@nvidia.com>, Or Gerlitz <ogerlitz@nvidia.com>,
 Yoray Zack <yorayz@nvidia.com>, Max Gurtovoy <mgurtovoy@nvidia.com>
References: <861390d1-1fdc-4dcc-a431-236ddca42dfd@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <861390d1-1fdc-4dcc-a431-236ddca42dfd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Gustavo,

(+cc nvidia people who worked on nvme-tcp from [1])

On 23/10/2026 20:02, Matthieu Baerts wrote:
> I'm working on the Netdev CI, and it looks like the Nvidia NVME runner
> on Collabora's side is frequently missing results:
> 
> https://netdev.bots.linux.dev/flakes.html?tn-needle=collabora-nvidia-nvme&min-flip=0&br-pfx=net-next-hw
> 
> (Look at the non-coloured blocks.)
> 
> Is it normal? Do you mind looking at that please? :)
> 
> I hope you are the right person to contact for this kind of issues. If
> not, could you please Cc the right people please?
> 
> Apart from that, the single test seems to be stable!
> 
> Note that when an active runner doesn't process a branch, we cannot mark
> the whole batch being validated as "not causing regression" because it
> is lacking some validations. So when this happens, the end result is
> marked as "pending". That's not an issue when it is once in a while, but
> here, it looks "too frequent" not to be reported.

Sorry for the ping, but any news on your side about that?

The "collabora-nvidia-nvme" is still disabled on NIPA: results (if any)
are still fetched, but ignored. It would be nice to re-enable it once it
is more reliable.

[1] https://lore.kernel.org/20250430085741.5108-1-aaptel@nvidia.com

Cheers,
Matt
