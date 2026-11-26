Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692739;
	b=21kvaYnDv0P1AEBa0feGNTaQ6uOTpyyzLH8udA5HCVObpQCMeLswZd3ooW0nt6/viT9f
	 cxyvhcaz2jvchao/dRiVnrdaperFRFxiQWeJWlk7FqtR4Q0dvSOlCLZU3+hBSP9igp3OK
	 CcnpKdhWYtksHaFTbXgp7RBhqEOPGFD8C/h9eQbRkDb9YA1p5KzrLi191BRe3ZlcH17QD
	 awAwvHxP3DK2HljzLC2thYbuSVgUj/qtl1+zW8orW+gm3jggZPtYUJA2q5OTzBwQ8Lin8
	 7f3ILLI4LqE/X2lAwLQn1XbWtssd04tVCTl7N2nzpiUKFObg1JcO3ugO8GGg2Di0KFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692739;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=eZHk0lUewvFPiZ+U/CMb2apduCb+QafvCAoyz+WUt1I=;
	b=P3DrxkyBTIU8Y3IMbqrdXAVFQR9Ubj17gXo8od4bBLli1t9QFelNezZsJwk1eSCJvoHm
	 jq1f2STyXUUtx8OpM7xyvaMYTf4cMjIkLfn2bSQy1yP3/vhqmgYdySucyorPPoSwvHEmZ
	 J8cquv70XT1CRvnAwKBZz1PaNnrn7GKiZseq/TSWMg2inpveLRS25hrDqPYGvJJRtY25x
	 PzKN6WcEl1RhksElLSas/NcNHEWGB+v0SJEJb7QDsSjF/+ANT+0MhZLsYqWzrmYwpd/QO
	 7aOUwlDNRuz3tc/fIKQfDaRWE7BVv5ybRxxsBvi7iif1WzdKZ+zoQ8wHTetjSgpzBNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XTtbtpV1;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="A/2hT5d9";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DD9606A68C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 11:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3DD9606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XTtbtpV1;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=A/2hT5d9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795692737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eZHk0lUewvFPiZ+U/CMb2apduCb+QafvCAoyz+WUt1I=;
	b=XTtbtpV1AeV7exlpc4R6znWMAbNguXi/1BmVpB/f37GBtkAxGS60Fcyz2SEvmMBtnDcS//
	FuJcJoB+V/+0euKn1nYa+OmuTuSjqp2+bNaGTJQk9CEI73fO2TW6kIb23FtrkxGEvBwYZg
	MJPqx6QFSJLrxFURgOycEup0BFTvZtQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-21gQuFlZPb6J0ngEqQgH1Q-1; Thu, 26 Nov 2026 11:32:16 +0000
X-MC-Unique: 21gQuFlZPb6J0ngEqQgH1Q-1
X-Mimecast-MFC-AGG-ID: 21gQuFlZPb6J0ngEqQgH1Q_1795692735
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4a647e776b4so5280119f8f.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 03:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795692735; x=1796297535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eZHk0lUewvFPiZ+U/CMb2apduCb+QafvCAoyz+WUt1I=;
        b=A/2hT5d971fEEgcxRU8UciKIPLvu2F38OKKOaR7oU4K+cWGmsn+g25d7hz8++QRdAv
         Y2cUsvPNI3zcqwLm9vGTdueFRvWAC2uA3ljdb8tEWZqchCL6kBaSYoSvdXmRfdYZyO5B
         B5hDP4A1VgDR2x/bVBO0Uou52LPba90yg7c08tDOBlHvYGpa3Un365wQ2RgnFHNTcBb/
         AMvgQTDf18h74SSt2BierG2brTy5amSOQ0GSGnvFTnQ4reptuU+s2x3OsdLDyosjABT3
         dLKdXuKJefDCRBF8G7Os8o7qGKKff9uSSbP7hceJtHCwTJdwijfFuBbXkiXAaNJa9x0V
         MEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795692735; x=1796297535;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZHk0lUewvFPiZ+U/CMb2apduCb+QafvCAoyz+WUt1I=;
        b=LNCvUWD4Ul2DFhdt/svJWiDbrs7Wj/UaWeXJ8/64snoClqQySTQ3wi6RX0NC4PsT9e
         hYu0ColucvNJMGN8Jy6kaX7vsQhKylEfQ7iC08hEociT+i/ZGyfmoWctn5j40a+wFu0n
         ArnhhhaBoV7QQbjlfn7xmQ/CS1ZD3zfwDg2p14cYjnr6HofpmlMHtva6zUYuzYymi+kr
         f7n0CWVqq8EZCmSRcgL0tCZ/7zTt+8e74qROAQ2fP2CIgbGbwDJsGo213Xk7t6lGzkKw
         q6n3HowIMh/jJEQT97YM1AmWFUzgPREjnbg0v9pY95Qr4a2NVSsDjvgS2J1ke5kDIGzr
         Pswg==
X-Forwarded-Encrypted: i=1; AL+hErGaTJc+rbeBrmGAE8RM4MkzozT1yoejz5deakJToZ3XnNcwliclxLp3Xozh2zDD5Hf4hTYKJSU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e+6YD/VnXiT1liagAT9xS+hq55xzwEiNvm7pB1PfpQxuzbJyJ
	3bvLHJfV9zzzzAxSK1E8tgAo26TTWteaTHhryP2zeTMAjQgHDpGjCN0GLBLCt0NOCL+HMdGQOeM
	F8o0/NHm5tfQl7ThdCiRUfaIyfZlp0TIs1lF/7UucSqzULG+OD4H3eXZU+Q==
X-Gm-Gg: AZFdTZcKbtIksO1vluetcpH0hBoCtMEbx4aljUuTEbwN8B1aSjUX4zrjQHpCIgKr1qs
	+rNnUdraB1CN4Qoe8yjl6dApmsi6u96Fo9IpH8XdMPaDRQrbMhxWtDYLdpRZS74TsyLnqAzArTR
	qvW4WIoG+5gQdja5WiyYb4PJxkfhQn5lxg1SlueSnKbqhXdAjnCCQg/eaZK8jOn7Ib5j28GYKj6
	b1rL9XhdhEB5vG8SqNSTf91TB8xIO6Ly9YWEYKlBZQalajS9kvCKaGiQlB/BSI3WMezP8H6z0wN
	SNyQh1WNAekx3YoHQ+EHzkHSAGWOuhjhINsPP4VyBQLtSoAwTxE2b9nGV3oyP2qgi0eqCMCICAq
	v0YjgJxK2LXPoGf+mWeBtHv4Qitl6WdJUFmOROfgvWTiKEq3nM9JSIvoOa85YNN3ZpKTGyuG5sU
	M3A3MoIPPq6rztFHkWxHaKR/iw2ei4wPEkJAgOLkBFRzqq
X-Received: by 2002:a5d:5888:0:b0:48c:4a62:9af7 with SMTP id ffacd0b85a97d-4abb70d6148mr36056406f8f.28.1795692734648;
        Thu, 26 Nov 2026 03:32:14 -0800 (PST)
X-Received: by 2002:a5d:5888:0:b0:48c:4a62:9af7 with SMTP id ffacd0b85a97d-4abb70d6148mr36056360f8f.28.1795692734155;
        Thu, 26 Nov 2026 03:32:14 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm38692194f8f.56.2026.11.26.03.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:32:13 -0800 (PST)
Message-ID: <5c2785c2-d041-4a8d-bf1b-4c2eab47b888@redhat.com>
Date: Thu, 26 Nov 2026 12:32:11 +0100
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
Subject: Re: [PATCH net v5 06/14] net: pse-pd: check the PI state under the
 lock when setting a power limit
To: Carlo Szelinsky <github@szelinsky.de>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: netdev-bot+sashiko@kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Kyle Swenson <kyle.swenson@est.tech>, Ross Cawston <ross@r-sc.ca>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <c84543f7-b824-4da8-9f8a-8e15d8f89140@bootlin.com>
 <20261120100851.2377899-1-github@szelinsky.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261120100851.2377899-1-github@szelinsky.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 11:08, Carlo Szelinsky wrote:
> On Fri, 20 Nov 2026 10:32:01 +0100, Kory Maincent wrote:
>> You have my R-by on all the series so we can only wait for a net
>> maintainer to take it. Jakub, Paolo, would it be possible to take it?
> 
> Thanks Kory for the quick reply, I appreciate it! I am looking forward
> to Jakub's and Paolo's feedback.
The series LGTM, but is quite big and AFAICS fixes issues mostly
present from the beginning and affecting the device initialization
/tear-down.

At this point of the cycle the above does not qualify anymore as 'net'
material. I'm applying this to net-next.

/P

