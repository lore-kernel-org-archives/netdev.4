Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423995;
	b=mUAtholL7L5rgDKgMQv260ApbriQehsOnwcrvvRR34/A21sQj7I/YYSmghbiV4UolepA
	 PL9l+EWTGBwLCxPw7jue6+3qkAx1nmWPbIZdJngo786ziY1efNZqr6/Bmhhg7RLPoh2OX
	 Nvj4ypT6y0fA66NZqET1aM3czINeVF7hW2sTho9bY/7+xiFXwyHtoAc8djYzUvx5+krCz
	 CrTxC0v6+03GVkCg8G/5n/pSk2V7N5cZvBOFtsOTpI2ahctNs4r1TxOGr+tSuoUwiauLW
	 faHLh0XDdUadTUsyCq/MbNNcnTJNADFrAZBF57yF8oP2+fLkxXfRfa9Lvk80rW+3jBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423995;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:Organization:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=A5V49pFKG8VIMRKKucDPxD1uxso2+9VLESqYo/WKsCI=;
	b=gueWdqKakE98LCD1PYLm7Mma/L87B9ZWGgBefqN+n+3oO1qUKOlVk0ZCYxzGTAqJ/VzG
	 CXcWPo1qRIutfu7uUBdlqljmbajonxx3vRcr+1Z9QfDbOgtqn6nH/bvJpzuYYBCmScFHC
	 otnqZuo5xWsdqsRNifOsxvbR7b217d2yKEk7NirJyrrUITy1oU8zBqSfcjWlxfGxu90JA
	 FsWKwwwuLMiHBKWaiqkDCEJ/SU4R7q0gKp7hEvqpvTKeaD4Cs5Kg30UsoyIVLBjqvO/PS
	 +eaqOy1XxJkzW8QHUMVUf14GAbsfndoyeWlVPW7/BnmjSZKniSNvxybZL/HbmIyj0+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eSPV6cy8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B70606A32C
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eSPV6cy8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CC5A1F000D3;
	Mon, 23 Nov 2026 08:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795423994;
	bh=A5V49pFKG8VIMRKKucDPxD1uxso2+9VLESqYo/WKsCI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=eSPV6cy82BIFu4LAmaPa4LWd/JdHhKDVJBz7a282pIBMUQ5dbihCq47DofY5hSTue
	 T2dBzMgSCmGUe1ZJetmX6W8tN9MZzNEldISVZMRBmmRHjopamCq1GlgRYcP528/tDj
	 ESxCTnfqHtREC0INaaQ/Aa+t4fC2e49NZhQ3JSkbfrsSt4Kwig4TeEbi22QmnkXeKB
	 ixAn9ltTDQEtuNEAz80ou4/izXu4a5vo8jZFfeh93EB1fvsEv3IcJ+QqWnENeTeUEd
	 ebl4x7alahEoebOEwKpxGMCIeoirL0drWZ/sU8/P0XFK2RV+6y34/EpKu9d7bs6UJe
	 qxQkxR+CWO4rA==
Message-ID: <9cc095f6-fb9b-48d1-9aef-f40283e84a78@kernel.org>
Date: Mon, 23 Nov 2026 09:53:03 +0100
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
Subject: Re: [PATCH net-next v7 00/15] devlink, mlx5, iavf, ice: XLVF for iavf
Content-Language: fr
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Jiri Pirko <jiri@resnulli.us>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Michal Schmidt <mschmidt@redhat.com>, edumazet@kernel.org, horms@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, Jonathan Corbet <corbet@lwn.net>,
 skhan@linuxfoundation.org, rdunlap@infradead.org, andrew+netdev@lunn.ch,
 saeedm@nvidia.com, tariqt@nvidia.com, leon@kernel.org, mbloch@nvidia.com,
 jacob.e.keller@intel.com, jedrzej.jagielski@intel.com, anzaki@gmail.com,
 brett.creeley@amd.com, ohartoov@nvidia.com, Petr Oros <poros@redhat.com>,
 Donald Hunter <donald.hunter@gmail.com>
References: <20261121230123.316391-1-przemyslaw.kitszel@intel.com>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <20261121230123.316391-1-przemyslaw.kitszel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Przemek,

Thank you for sharing these patches.

On 21/11/2026 23:55, Przemek Kitszel wrote:
> Also available here
> https://github.com/pkitszel/linux/tree/xlvf-v7
> (no mlx changes, just kept series name)
> 
> The purpose of this series is to allow iavf to use more than 16 queue
> pairs, in two modes: up to 64 and up to 256 queue pairs.
> 
> In order to support more queues for VF, we must give it a bigger RSS
> table (GLOBAL LUT or PF LUT). There are 16 GLOBAL LUTs on E810, and one
> PF LUT for every PF on given card. Both kinds could be (re)assigned to
> a VF, while a PF must hold at least one of them at any given moment.
> GLOBAL LUT allows VF to use up to 64 queues, PF LUT lets it use up to
> 256 queues.
> 
> RSS LUTs are exposed to the user for assignment via devlink resources
> API, which I have extended to make it possible.
Recently, many HW selftests have started to fail, mainly on ICE and with
tools/testing/selftests/drivers/net/hw/rss_api.py, but also on CX7:

 https://netdev.bots.linux.dev/branch_deltas/net-next-hw-2026-11-22--08-00.html

I wonder if it couldn't be due to your series. Do you mind having a
look, please?

Note that because of this series, the following WIP patch is no longer
applied, and maybe that's why some tests are starting to fail:

 https://github.com/linux-netdev/testing/commit/d00ba0185d53

I suggest dropping this series from the tests for the moment:

pw-bot: cr

Let's see if net-next-hw-2026-11-23--16-00 will still have these issues.

(Feel free to also look at the other flaky ones on Intel NICs, see my
other email thread)

 https://netdev.bots.linux.dev/contest.html?pass=0&branch=net-next-hw-2026-11-22--08-00&pw-y=0
 https://lore.kernel.org/5aec31d5-d042-4263-b3df-fa5a6a1399ec@kernel.org

Cheers,
Matt
