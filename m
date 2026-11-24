Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528530;
	b=ZZRLSdKCEr0gs4JUFOk2Xta/xPdjGWE/Gp365IMnHCnhc1Q7ap80YT5EO9XFm8bNUsZN
	 Y5Opdy04i1T58RRulYt4leW8hftYcwuycv9S5ygUDWGW3nWVVLGMlF6hGh0UnS6l0daNS
	 67xnsJmvxidYmdEQj7wBrPgFgBLwgS0N8UPbkjFN1oPbCBYuNY1ENqH1zkWK1vlsLt8Am
	 /zJmnlmyrTJGr8m4Cqn7GJOdznu+wnmV/71+d415MEwuf4FkdNhGto1E4ISH4sgUaBG/e
	 gZ/hBSIrlZ1anX6SzbbxfwyPvur4/cYbWrl8SZbPQYwRaCJSLAee34mqf3KInnEMlvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Reply-To:Subject:To:Cc:References:From:
	 Content-Language:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=I1beTTuDkHcJrFtkrdIEDwGOge1ar4jfKSDiYm+SAes=;
	b=G3SL2ykWynZhI9oRNxZyKcxEyavb+93o5Olpo6z9RzMfhJeh6Y4lSfy0uW4Iw7JBXSvT
	 iujDQ5pPr2rz0kXesOfoq80XUaDeLFQJ0OqRRvRwNjdygwLSqLDQGz7cBLzSagnUUJqoP
	 67lB/IpYff+cUENZIu/3RQU0RTsUZlwsItIFIFfzl7KTQB/rT4hiu8RFlBlW/XldUJpn0
	 N6CqInhCS4xtOdpTev6VqrEoSd0QETlwSyFIt2pOLQ8eheuwbVM83jzo9BtcIa5jA8dB6
	 xWmmiU9fjBxLL36aYfiTzlKhAXgaCQTo4qJfQwaBFtFieuv35WffpsPEqdK4aRVNzVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=6wind.com;
	spf=pass smtp.mailfrom=6wind.com;
	dkim=pass header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=Y2bsdeUG;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C811C606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C811C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=Y2bsdeUG
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c408e21e8acso74159066b.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 05:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1795528527; x=1796133327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I1beTTuDkHcJrFtkrdIEDwGOge1ar4jfKSDiYm+SAes=;
        b=Y2bsdeUGRkhvEwUU7zA+Ccwi7nQaUwSHzxZBaZ4811Twitth90vemfuauNp3AqPTj5
         FzQ2ayO2yIqj2+f5itd7nxfGgGmg46Y42OdYNwLVeKI1BvNLReA7ROzQg5P5QM1jfE+x
         ERu6bMFz1PNLPKVM/wxS0Z1Ggk2SW9lhivGplwZnVpSMC5fdYcuB/Cn9qGdq4URirwED
         van4HZN7J1SKjJ9KU/JspZfLnbHYMonP2cokgyoMnPREAQDWLkuFpvMwLbwyKFxv/WZy
         DH7TB2xui6Lg3bS8WmzuzW2wxpA7MXXUCrNaKcxy+XTz28I3PPQMyWL6amYPir4Ud9ax
         32Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795528527; x=1796133327;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I1beTTuDkHcJrFtkrdIEDwGOge1ar4jfKSDiYm+SAes=;
        b=y3c9APobbxmxt6Vq1Dq0ZOSOoW95FUJj58SJ8MlomSBtF+XxBW24D72SySo6mqhB7m
         d8C+7Ac9oNlIfw4ZCyfIu51WKwCVLvh6uoOOLaDW610JXTNyQlk3RfXwxNthgMoeRKQ5
         Abyh+/d4XT+mUrDrfmQraBKOXAUV54fQEf6pTYJPdujHR23R/cqOxP8r3Kzx8eERPXfT
         tcQaqTfSdlUz/9+AfYAPRG7OpfKQ7kvoFHAZHRTpzWt8BKw217/SZwAYaHchqaqdImuu
         hT6LZ+wKShobbKwI43clSLwdxP/YLjh2fKOGjzMhLvw1NuK8ILTJgB92o6Z8H2kG6voh
         OWOQ==
X-Gm-Message-State: APuU4Z8y8XSx5WFYtlXqcb2X9idfsrYNMIRO+ayeY7Uuu2Ut+uHQ5SzA
	OwkGzwlORUsOmog90WA+02l39yjtzyQTwRtL1j0shAsYsJunpNVMi7DsTmM2rzQ0HLaKPKQ6obb
	fSnTK4pU=
X-Gm-Gg: AZFdTZcKk/zFVZD9gukGte8M2GhGhuSPInuZxJmvh8KqbKyvJetDv2xf2FPT4hH4KLN
	FxShHJYbd0pWn0P0xqqdXnz5WQ/LguGlCdVgWx7XPxJsiP1f9l7ape5wLeURSNkj7/RTn7qzVJe
	Iz6kTzPauGdLQHKOpp/4PChkWzrDynO7oUyzCcHG26P6GPypOv+o5NN+FOLpELyjqldmGUi9bHe
	CuPKq+Wbl7ppG6hI7SuI2Y+pJc+MPbltj4pTPaxmLwmTX+d1v/nLp9TCc0AmlN1ual9c47D20Rj
	YymqpyKsGhIbkwdjzM4UztTgxSg6tuC7CeQm8t8gaEoFbFPxYmAhG0IX8AOTadh310JdkhGrZXk
	RExYfwgi25aUCYJuofZFIKAqbfiObgAlDVmYIhLh4C1fjFD26AM9tGIEcl33DEjlUT4dJLqY0wY
	EQrRSumla2GWaTbdjAEcLoB64nYB3O9GpMmRZXGVIoBiCXKWtndCT9HM2eOHbaedn/LblkX2sve
	2MMsH9i/CqlODNykngK1XF74oi19c9umL79y82H0lVvnXyLYaloiEuS/BaNrMhCzfRkBt3xACKh
	UBUJMWlzuHUm8gEwckBdb10T4nFVXRIRLB8+ZQOmYPQoDt0S+OfpHT3BsH17KOsyEHle74QNi1v
	grCkSOQCnt1bd0ojGRqqJfQUkjwg=
X-Received: by 2002:a17:906:2b5b:b0:c29:4634:5c8f with SMTP id a640c23a62f3a-c513a284994mr1056327766b.0.1795528527042;
        Tue, 24 Nov 2026 05:55:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad01afbsm518330366b.5.2026.11.24.05.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 05:55:26 -0800 (PST)
Message-ID: <8f0c4cb5-8754-4636-abdd-ccec7ad5d932@6wind.com>
Date: Tue, 24 Nov 2026 14:55:25 +0100
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
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net 1/2] ipv6: check the scope of the best source address
 candidate in a VRF
To: vjardin@free.fr, David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 stable@vger.kernel.org
References: <20261123-for-upstream-ipv6-vrf-saddr-scope-v1-v1-0-f667ab150ade@free.fr>
 <20261123-for-upstream-ipv6-vrf-saddr-scope-v1-v1-1-f667ab150ade@free.fr>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20261123-for-upstream-ipv6-vrf-saddr-scope-v1-v1-1-f667ab150ade@free.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 23/11/2026 à 15:30, Vincent Jardin via B4 Relay a écrit :
> From: Vincent Jardin <vjardin@free.fr>
> 
> When a packet is sent through a device of a VRF, ipv6_dev_get_saddr()
> first checks the addresses of that device and of the VRF device.
> It stops there when the best of them has a scope that fits the
> destination.
> 
> Since the commit abb9a68d2c64 ("ipv6: take care of scope when
> choosing the src addr"), that is what the scopedist of the best
> candidate is tested for.
> 
> scopedist is only written when the rule scope compares 2 candidates.
> With a single candidate, the rules stop at the first one, which only
> tells that there was no candidate yet, then scopedist is read without
> having been written.
> 
> It is 0 with CONFIG_INIT_STACK_ALL_ZERO, which passes the test:
> a device that only has an IPv6 link-local address sends to
> global destinations with that link-local address,
> although another device of the VRF has a global address.
> 
>   # ip link add site2 type vrf table 30
>   # ip link set site2 up
>   # ip link add dummy0 type dummy
>   # ip link set dummy0 master site2 up
>   # ip addr add fd00:91::1/64 dev dummy0 nodad
>   # ip link add dummy1 type dummy
>   # ip link set dummy1 master site2 up
>   # ip -6 route add fd00:93::/64 vrf site2 dev dummy1
>   # ip -6 route get fd00:93::1 vrf site2
>   fd00:93::1 dev dummy1 table 30 src fe80::5cb7:13ff:fe96:87ac metric 1024 pref medium
> 
> When the scope rule does run, scopedist is negative, whether the scope
> fits or not: the test fails, and the other devices of the VRF are
> checked too. One of their addresses can then win on a later rule,
> the longest matching prefix for instance, over the address of the VRF
> device, which the first lookup is meant to prefer.
> 
> So let's compare the scope of the best candidate with the scope of the
> destination instead.
> 
> This issue was found for a development of a UDP tunnel device with
> IPv6 addresses in a VRF selecting an IPv6 link-local source
> address for a global destination: then it was confirmed with the
> fib_tests.sh case of the next commit, whose first two checks fail without
> this fix on a CONFIG_INIT_STACK_ALL_ZERO=y kernel.
> 
> Fixes: abb9a68d2c64 ("ipv6: take care of scope when choosing the src addr")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
