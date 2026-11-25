Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795576893;
	b=B6pTn7YmLsFbCiQ+uWnInR3/30dPIN8AW7rKPuMU1dt8fFucSTFn9V6LSqfnSDPVl/7/
	 tG20Fu0hZ1As6KgCMZVRlQeX2P1QtRiqRMkL00472tzuE1IChvaTZsikcxoJIpomQdrF7
	 N6gGOIZecqnw/ycNYVbOG4vc20C9WC/dsOhmYozc/1S1AGkCUWX6uc8/OY0ippZ8rDJ9G
	 ieZicdyVqYbc7q+qsYsbewJnCPJ3I4Mk4hvXPMcsuXmoxMG8VzaGls8qFWYTB2Kjez2DH
	 y/QvfrLMDEA1elN41uN3QH7REzfGWQTT09yCbtxd0MRo+i9G+Xs5N3cWSaeAmdb80tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795576893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=x882e7OTmAYxUut6y8OPWB+mfBqKYDNjHUdHSvwO/Ow=;
	b=sVImoplisttt/zvZdFbP27NL8UTOxrUGaUQaVQFYCHAtT55n1g0L1SHP9CL3UrnMi7ly
	 tQduF9erplPDdX6H5/fIy5reQtKufhG4cvZ+wMv5Y3fcf2XBRIPD1uHdaOnHN+U4tvXxW
	 uIi+kBH26xBWIED8DIsbNJXcPknS8dAEbe6YvS341UPv6yxizx3RuHf8ijmGjrvy2dHk7
	 YPkH7WJAUTTsUemU7iaM43mOeDUxABrBjpmHjwCoQsxBmVYssBDUvo0JkWNTqa995KO9u
	 NmiqAgH0GhcYKpN7hy2D+W3TlJLgooXxCAcmS2eOr72CGsZGXwd+6445xp6Ce4FXOCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0hr5G6Ci;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15832606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15832606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0hr5G6Ci
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38699cf08dfso6084037eec.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 19:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795576892; x=1796181692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x882e7OTmAYxUut6y8OPWB+mfBqKYDNjHUdHSvwO/Ow=;
        b=0hr5G6CiYwviZ48zaFQj1P2lBE1BZI28rhQg/97jLtjNS4k+9YIzro5JBC+nnhbGi0
         TuFxd/JwRym2eyvsjKppO6aEkqIVCyMjJOue3YzcyqDqTaivIX7Z9omDLJPcjujOiHPf
         3vONMosmapHms46Za13J5qGttrAwgfX9ajcciGxnfHoyTxhjpP1tXVPEd19NP8e8GYf+
         7Brv1edZxDBWs4J3zfeM8Bsy0mX6Rnnj1B4Btj1kW0Btg1PmbpKtNsyAS7ud7BtdIEO6
         LAxNC8lQNDQBTq50pzTueurl7xU3RBBmCZWv0RzRBEtUDxlUFgVZ9O9v6dJoAjICg1HX
         kNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795576892; x=1796181692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x882e7OTmAYxUut6y8OPWB+mfBqKYDNjHUdHSvwO/Ow=;
        b=t3Q4UPOh8rROV2nKZ5KIq39dzAh6YLJa1sugMrYIm9Z0ObEKI9bb9E+XI/4n1NJj/E
         VlwNhX/PLO3yqeMpLa2t2n51Af9xNlJuvtwzFtrlXDmNpAWFzmJotlg8bbiKjmUAF/v1
         Df+yEDy1oLY9QOOxLZWMYmJYrtJdVVi3L28nQh5eCibuGkR7dA+ykWFZubKdRugFKlH4
         yW+0NV32XDaCTsDsyxh6utVqO0fw4y4brMWGNs2gFjl3B50BL4b+TTAEP0xrDG0A6mZs
         cGLSQoBGLtvUCpCzDNbbZBNdePWDe1JzLrvgvAuiJLOmh6ga4h7JSXo0nCAq+PQXAQHv
         CMZA==
X-Gm-Message-State: APuU4Z9b94yxKrdExkUDWxzMwayJqQpG8GHUARCV9jyRGpJm7sTKqOFV
	euQWpaPZod1d5jifAQOeEvpdiBf4wnDlI2xdDc9RjwagTvGJOHxpJQ/DPpRABA==
X-Gm-Gg: AZFdTZdk3C6JocjmH2CFYTFARAwhF7LltMz9q9X5DQCQiVQAyRMvlcvJijgwv2QSIGk
	GbcwOcBGz0X820wLxQpHStaACcAsbpqbVePMuFKms8pdUVANnsMaWKJGO5PozRvuSIBaRemj1Qx
	RT7Cw3f8c3yodMGSR23SlA4PPu4FBXxDCOrz2AMfM6W3lCNVCCuV/LqCFC1yHp+D1NcXGjVm2+d
	qen2oV8QJpnk533ZTMUpM/yvIy2gDgUy1/kMcZ3hbLfalQCJKL4H2ftOJwTwXqKTxKo1GCpKY/L
	vWn2mmswAAiAl9EQGNF3/bXOCQk1kKVpF3hjSWyT3tJSRdMMmIPrXjlud6FJkvoMCPEKE1ZKe6y
	iray+nUUUY2fIxnJq6ovFW1A4Y9UZfl2WefRd7nrze6YCpRmzirIt3eNW4xUVhxNzTUF6ZAeRSK
	fHg95ctwwH5mSuE142ZRIY1modZq9tS+1ekplMIEcYy8Gt6a+hpUudX7ZHXnp5+Dcrs5Yn2ZOO2
	3H+FsdMDdvUAQV6Fy7iC6g3SFgnXF/Nh+UCsx4mhT9itVkM+DHUWQ37bCCuYUzQwTkYoxHjbCdH
	fn4wuRAk90ePICSRo3GaOMaNDSy8Dd+nzxGqswyVOV2jBybBaMBK+fU4G/vw2kvLfdohcPeFVO1
	HEIolL1365x8YslzKbWIYGlHiZzxEEJ+5oEc5EIT1dhpoAgSz4HOLr9P2XLWacFxqpxQQatn1SH
	o=
X-Received: by 2002:a05:693c:835b:b0:386:b5ad:b719 with SMTP id 5a478bee46e88-386b5adc3cdmr7111743eec.33.1795576891727;
        Tue, 24 Nov 2026 19:21:31 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm7256012eec.17.2026.11.24.19.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:21:31 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	idosch@nvidia.com,
	nicolas.dichtel@6wind.com,
	jacob.e.keller@intel.com,
	jiri@resnulli.us,
	fw@strlen.de,
	martineau@kernel.org,
	v3rdant.xiang@gmail.com,
	aliceryhl@google.com,
	linux-kernel@vger.kernel.org,
	nhorman@tuxdriver.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	anilkaushikwireless@gmail.com
Subject: Re: [PATCH net v8 1/2] genetlink: Reject joining multicast groups no family owns
Date: Wed, 25 Nov 2026 03:21:23 +0000
Message-Id: <20261125032123.2664525-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <179553579407.3135.13476478403966318528@kernel.org>
References: <20261123155503.2497063-2-anilkaushikwireless@gmail.com> <179553579407.3135.13476478403966318528@kernel.org>
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

On Tue, Nov 24, 2026 at 03:56:34PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Can that window still leave a socket as a member of a group ID that no
> family owns? That is the state this patch is meant to prevent.

Yes, and the commit message says so. This window is not new: it is the
same for groups with GENL_MCAST_CAP_* today. Closing it was patch 2 of
v5, which was not accepted:
https://lore.kernel.org/netdev/20261110121831.01412fb9@kernel.org/

So this patch only covers joining an ID before its family is
registered, which an unprivileged user can do at any time. The window
needs a family unregister during the join.

The selftest issue on patch 2 is right, I will send a v9 for it.

pw-bot: cr

Thanks,
Anil
