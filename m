Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191370;
	b=v1xjkRj5aqn1ejA60IGWWmDfwgXY/pMXifOP5W7+KDBl7k3FM2/UY5/sr+K6nLewB67+
	 vGV9HV2BgLQRDvieIawIK3bho4+sbwzg6WmA/h4R2rrdjCna+fLtn7PZ8WU0xk+ngx8YI
	 jpuC+fHJEVrdR4eD/0oCpfw9Bnib7nqQevj60/O2qikUCkI5GwYTFo1f4/e/HxODDokIO
	 A0jCwbHnWR8XottrtbStWzCzV+N3mAMNH435R/FGCWkM/dCIGDd64mdmtpaOlboKkb1km
	 BG7AVxVF0eUFe4V9rnSlbeimuv7YuUeVopyc2UD0UP8bXsodM+b/PJfd6tk+clc1JXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191370;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:From:To:Cc:References:Autocrypt:Organization:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=RpVX37oMZV9KZ1lIbuiCDSV7t38+1Pw/dXFwNywqMyM=;
	b=JrF0hO22yPJ9S2BT3PPvKlMVNkdYCEMejw4D5oD/w5VLZr36z+wAQbV775Q94+ysA+qd
	 dwytGQxIH8WZXnZICiyXRn8k1+zFz+qQj4Op1cMW2h+99kH6e2vQAVB/V6rM2yRpA/6rQ
	 dDJAaleoVtrD8MYA7akAXfjVX/wE0CjCQZE3TnVyDLTkqwBMyw14HYC6G1NGL+T/PjmPC
	 sV7MAnsxi7WPcbrg898/tbsxEhwFAtzZgTgAMyqttSelbJcauj4NdCL39JFVSaYozjWUM
	 ptdPKasfs0skxvAgIyLSDBbWt49EjhnrzaHiwt7PtDsFQzXI95IOnbrPls1xOy3x9tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DLjgQ8zg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50D5606A32A
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DLjgQ8zg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C7491F000D4;
	Fri, 20 Nov 2026 16:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795191370;
	bh=RpVX37oMZV9KZ1lIbuiCDSV7t38+1Pw/dXFwNywqMyM=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=DLjgQ8zg6EcbsQr4dcJpJb6sqrIkfOss0jQKck1oqHQa/AlnYCpRT3GDeUhO70hfs
	 HwAAA62bO61iyrcwmY2q1PDPOESamq1gvPbvHAy4rhfPXBoyCtkFRbz+y7bFmXqJVk
	 cqlC9HEkGab6YgH0HqpRu8ILEhMWIfZimRfGNoD7C9RI3aPCfl17D7f5I0yD3UNQ12
	 HvuPViTDA43BteySpsNCQc2eY0ubMS2wPQmqhVCSuxXHNQtQn2ZiEqTQvndWdGhYBS
	 WZIVtuKi17fJtygzyZlt7MtXkVl8/0Mq7Kg795lxIL6n9wAkdtAsXVnSFa0TPZ9x4s
	 MKMbXlv3xGtLQ==
Message-ID: <520dc50c-d80c-4926-8eed-a8960d1a83ec@kernel.org>
Date: Fri, 20 Nov 2026 17:16:07 +0100
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
Subject: Re: [TEST] Intel's Netdev-CI: a few flaky tests
Content-Language: fr
From: Matthieu Baerts <matttbe@kernel.org>
To: Adrian Pielech <adrian.pielech@intel.com>
Cc: Przemyslaw Kitszel <przemyslaw.kitszel@intel.com>,
 Netdev <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>
References: <5aec31d5-d042-4263-b3df-fa5a6a1399ec@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 xsFNBFXj+ekBEADxVr99p2guPcqHFeI/JcFxls6KibzyZD5TQTyfuYlzEp7C7A9swoK5iCvf
 YBNdx5Xl74NLSgx6y/1NiMQGuKeu+2BmtnkiGxBNanfXcnl4L4Lzz+iXBvvbtCbynnnqDDqU
 c7SPFMpMesgpcu1xFt0F6bcxE+0ojRtSCZ5HDElKlHJNYtD1uwY4UYVGWUGCF/+cY1YLmtfb
 WdNb/SFo+Mp0HItfBC12qtDIXYvbfNUGVnA5jXeWMEyYhSNktLnpDL2gBUCsdbkov5VjiOX7
 CRTkX0UgNWRjyFZwThaZADEvAOo12M5uSBk7h07yJ97gqvBtcx45IsJwfUJE4hy8qZqsA62A
 nTRflBvp647IXAiCcwWsEgE5AXKwA3aL6dcpVR17JXJ6nwHHnslVi8WesiqzUI9sbO/hXeXw
 TDSB+YhErbNOxvHqCzZEnGAAFf6ges26fRVyuU119AzO40sjdLV0l6LE7GshddyazWZf0iac
 nEhX9NKxGnuhMu5SXmo2poIQttJuYAvTVUNwQVEx/0yY5xmiuyqvXa+XT7NKJkOZSiAPlNt6
 VffjgOP62S7M9wDShUghN3F7CPOrrRsOHWO/l6I/qJdUMW+MHSFYPfYiFXoLUZyPvNVCYSgs
 3oQaFhHapq1f345XBtfG3fOYp1K2wTXd4ThFraTLl8PHxCn4ywARAQABzSRNYXR0aGlldSBC
 YWVydHMgPG1hdHR0YmVAa2VybmVsLm9yZz7CwZEEEwEIADsCGwMFCwkIBwIGFQoJCAsCBBYC
 AwECHgECF4AWIQToy4X3aHcFem4n93r2t4JPQmmgcwUCZUDpDAIZAQAKCRD2t4JPQmmgcz33
 EACjROM3nj9FGclR5AlyPUbAq/txEX7E0EFQCDtdLPrjBcLAoaYJIQUV8IDCcPjZMJy2ADp7
 /zSwYba2rE2C9vRgjXZJNt21mySvKnnkPbNQGkNRl3TZAinO1Ddq3fp2c/GmYaW1NWFSfOmw
 MvB5CJaN0UK5l0/drnaA6Hxsu62V5UnpvxWgexqDuo0wfpEeP1PEqMNzyiVPvJ8bJxgM8qoC
 cpXLp1Rq/jq7pbUycY8GeYw2j+FVZJHlhL0w0Zm9CFHThHxRAm1tsIPc+oTorx7haXP+nN0J
 iqBXVAxLK2KxrHtMygim50xk2QpUotWYfZpRRv8dMygEPIB3f1Vi5JMwP4M47NZNdpqVkHrm
 jvcNuLfDgf/vqUvuXs2eA2/BkIHcOuAAbsvreX1WX1rTHmx5ud3OhsWQQRVL2rt+0p1DpROI
 3Ob8F78W5rKr4HYvjX2Inpy3WahAm7FzUY184OyfPO/2zadKCqg8n01mWA9PXxs84bFEV2mP
 VzC5j6K8U3RNA6cb9bpE5bzXut6T2gxj6j+7TsgMQFhbyH/tZgpDjWvAiPZHb3sV29t8XaOF
 BwzqiI2AEkiWMySiHwCCMsIH9WUH7r7vpwROko89Tk+InpEbiphPjd7qAkyJ+tNIEWd1+MlX
 ZPtOaFLVHhLQ3PLFLkrU3+Yi3tXqpvLE3gO3LM7BTQRV4/npARAA5+u/Sx1n9anIqcgHpA7l
 5SUCP1e/qF7n5DK8LiM10gYglgY0XHOBi0S7vHppH8hrtpizx+7t5DBdPJgVtR6SilyK0/mp
 9nWHDhc9rwU3KmHYgFFsnX58eEmZxz2qsIY8juFor5r7kpcM5dRR9aB+HjlOOJJgyDxcJTwM
 1ey4L/79P72wuXRhMibN14SX6TZzf+/XIOrM6TsULVJEIv1+NdczQbs6pBTpEK/G2apME7vf
 mjTsZU26Ezn+LDMX16lHTmIJi7Hlh7eifCGGM+g/AlDV6aWKFS+sBbwy+YoS0Zc3Yz8zrdbi
 Kzn3kbKd+99//mysSVsHaekQYyVvO0KD2KPKBs1S/ImrBb6XecqxGy/y/3HWHdngGEY2v2IP
 Qox7mAPznyKyXEfG+0rrVseZSEssKmY01IsgwwbmN9ZcqUKYNhjv67WMX7tNwiVbSrGLZoqf
 Xlgw4aAdnIMQyTW8nE6hH/Iwqay4S2str4HZtWwyWLitk7N+e+vxuK5qto4AxtB7VdimvKUs
 x6kQO5F3YWcC3vCXCgPwyV8133+fIR2L81R1L1q3swaEuh95vWj6iskxeNWSTyFAVKYYVskG
 V+OTtB71P1XCnb6AJCW9cKpC25+zxQqD2Zy0dK3u2RuKErajKBa/YWzuSaKAOkneFxG3LJIv
 Hl7iqPF+JDCjB5sAEQEAAcLBXwQYAQIACQUCVeP56QIbDAAKCRD2t4JPQmmgc5VnD/9YgbCr
 HR1FbMbm7td54UrYvZV/i7m3dIQNXK2e+Cbv5PXf19ce3XluaE+wA8D+vnIW5mbAAiojt3Mb
 6p0WJS3QzbObzHNgAp3zy/L4lXwc6WW5vnpWAzqXFHP8D9PTpqvBALbXqL06smP47JqbyQxj
 Xf7D2rrPeIqbYmVY9da1KzMOVf3gReazYa89zZSdVkMojfWsbq05zwYU+SCWS3NiyF6QghbW
 voxbFwX1i/0xRwJiX9NNbRj1huVKQuS4W7rbWA87TrVQPXUAdkyd7FRYICNW+0gddysIwPoa
 KrLfx3Ba6Rpx0JznbrVOtXlihjl4KV8mtOPjYDY9u+8x412xXnlGl6AC4HLu2F3ECkamY4G6
 UxejX+E6vW6Xe4n7H+rEX5UFgPRdYkS1TA/X3nMen9bouxNsvIJv7C6adZmMHqu/2azX7S7I
 vrxxySzOw9GxjoVTuzWMKWpDGP8n71IFeOot8JuPZtJ8omz+DZel+WCNZMVdVNLPOd5frqOv
 mpz0VhFAlNTjU1Vy0CnuxX3AM51J8dpdNyG0S8rADh6C8AKCDOfUstpq28/6oTaQv7QZdge0
 JY6dglzGKnCi/zsmp2+1w559frz4+IC7j/igvJGX4KDDKUs0mlld8J2u2sBXv7CGxdzQoHaz
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <5aec31d5-d042-4263-b3df-fa5a6a1399ec@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Adrian, Przemyslaw,

On 23/10/2026 20:30, Matthieu Baerts wrote:
> Hi Adrian, Przemyslaw,
> 
> I hope you are doing well.
> 
> While looking at the results on the Netdev CI for the Intel runners, I
> noticed some tests are quite flaky or constantly failing. I marked them
> as "ignored" on the Netdev CI while this is being investigated.
> 
>  https://netdev.bots.linux.dev/flakes.html?tn-needle=intel&pw-y=0&br-pfx=net-next-hw
> 
> Do you mind looking at them, please? :)

I don't know if you did something, but it looks like some tests got more
stable, so I reduced the list:

https://netdev.bots.linux.dev/flakes.html?tn-needle=intel&pw-y=0&br-pfx=net-next-hw

> Regarding tests that are constantly failing, I guess you are monitoring
> the results, and you noticed that gro_sw.py is failing most of the time
> on XL710 (i40e). If it is normal, it might be easier if you block the
> known bad tests from running on your side. Note that around September,
> there was a split of gro.py into gro_hw.py and gro_sw.py:
> 
>  https://netdev.bots.linux.dev/contest.html?remote=intel-i40e&executor=i40e-XL710-Q2&test=gro-sw-py
> 
> (gro.py was failing before)

Could you please disable gro_sw.py on your side if it is not possible to
fix it when validating this NIC, please?

> While at it, some tests running in our lab with Intel NICs are also
> flaky. Maybe that's due to the same issues?
> 
>  https://netdev.bots.linux.dev/flakes.html?tn-needle=netdev-(E810%7CX710)&pw-y=0&br-pfx=net-next-hw

Note that gro_sw.py is also failing on the i40e NIC when validated in
NIPA's lab. Should we disable it on our side too?

Cheers,
Matt
-- 
Sponsored by the NGI0 Core fund.

