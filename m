Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795042263;
	b=Lj+U9HP7VPobh3j46HZQc5R2eDUzSOv0J97ky6xuDzFRAe3nss6HTdyB+4i//kAADLYp
	 cyANkuEGdsP/CccvV44uOJ0bxwEDbm75Qf6QhCJwbLGzkzSdvmLxIcXbEKXG5RIWKlj9J
	 7EKZP3jpmvO5Gm1FTxPi03MaJV6aj6cFUgod6iO+AtAs5vdPlXx1YwZ43VUyQpqaxFvCz
	 yioRGk5lH40Jx+fPzFTMJlSAQyqKYtCJn3MMlHicUTASsvPTIDPY13sPIHeBzoWWmiKZO
	 TliO7xWaetHL7rBpouOrW/YZLfW8IGh/yLAIAB4Tz85A7V3H0vrfCL+AL2rhnOirMzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795042263;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=CWBJvpsMboC5fIm+EhmmjBPiJxGEcwAoo9l9AcLljrA=;
	b=T3f5fiBj8thttEKXj3W+JII1jlUrNK2PssK6vukPcI4hvAHMR6bONCKab01Y4P9Ugx98
	 5JlnlM3VO1gmPOxaCyHo2kwr3HKF9s6Rajxjt6XWvoVOx/omek19k2voUmXvn8qr1w1BY
	 RcalzYnVLaYDttGLDmZ3+XGX4pnm5B022gg7CerFxA8EANGllM2A47K418y8N3ALdXaJG
	 NUbEoyCDF0f1Ehgrdtv1qhCjjdkCnyzTYMexV4Uy2UPSXKraFElrHdKvPn0sl1tw19jTN
	 +N4zDypgTZfeRLqBBtvH6K/JwpngfVfXVBiWzmDXuORP4gYUon9SqyjQNFlfdTtVS+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NcEW0lMu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1A9606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 22:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NcEW0lMu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03981F000C4;
	Wed, 18 Nov 2026 22:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795042262;
	bh=CWBJvpsMboC5fIm+EhmmjBPiJxGEcwAoo9l9AcLljrA=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=NcEW0lMuKUF3bytYaCHYkKaC/3qACJRZSwN1ZbF0AomvLkxpeYOG4yFVfApeOt904
	 NYMlSyaDE677CwND14anFeGOGSQRziI1vBQxSqsM2RixJWgFT4gCvUL3nUQyGrGot3
	 FK80mqqd0A0trIghuVD1AVcbz9Gn8/WA8Y/yfhpPO3zo7A1KsyTWVRFEjWu8uXXNmT
	 eTajZ4hclrJSR1n7p4Eavt/QkXpT1rGMmb+adELa3bS1eT2/AEO7uvwjnhbKJbNoHU
	 m7PXzgb7iLDtR5JaHFt2ttRLQ0TgB+Z7w2wDPfhRvfwayIhFM68M2Q0eGFf66XS0Yv
	 JdM7Cv7CHO0ow==
Message-ID: <bcb9db70-7211-40ee-931e-40b1dbaa716a@kernel.org>
Date: Wed, 18 Nov 2026 15:51:01 -0700
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iproute2-next] ip: netconf: show IPv6 force_forwarding
To: Gabriel Goller <g.goller@proxmox.com>, netdev@vger.kernel.org
References: <20261028-ip_netconf_show-v1-1-a20fc6b20025@proxmox.com>
Content-Language: en-US
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20261028-ip_netconf_show-v1-1-a20fc6b20025@proxmox.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/26 7:10 AM, Gabriel Goller wrote:
> Allow users to inspect and monitor force_forwarding, which enables
> per-interface IPv6 forwarding independently of the global forwarding
> setting.
> 
> The sysctl was introduced with kernel commit
> f24987ef6959 ("ipv6: add `force_forwarding` sysctl to enable per-interface forwarding").
> 
> Signed-off-by: Gabriel Goller <g.goller@proxmox.com>
> ---
>  ip/ipnetconf.c        | 4 ++++
>  man/man8/ip-netconf.8 | 4 ++--
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 

applied to iproute2-next.

