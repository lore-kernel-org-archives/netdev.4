Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421135;
	b=bK8rFkwJPn7gpSYbqlkE5U/u3KDr03ujWT0OnlCMaK2Frkq/2UT5ON3JO/q2flgsiZy6
	 d7eQ5MdQiw6L9vPHJ8Z5c5HlMm+SzD871+9K5ymo2KvPTPqN+cJIUliJLQBA6wPNf1Ov9
	 sgpWqow+UIxpd4vw1v/e7M3UBabHtQqdeOodAvYderC2xcTwCtff95gtP1dWf93hCIYPp
	 2OulhldMLIRqSFsls4p3qV8B7hT/ceq+avqMOg1L2xc/234tUD1b7+Btfc9lhtYHIlqTr
	 I3tVyqNMLiA9cBKUQ/DIpT5uWrT20k4xkQ/zfYGJlNk2iMo9DofDKK8hw8TFRS4q/2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Pu4yypJl6coCX7FrhDOYrF2bQ4S6oHs6DmVHvAaSKII=;
	b=QL4WUr3i+8p9hJ+k1xlmYQMDvIJ2WwB+DDjsyn9dwytGMaVhBz3Luu7LqtVXTHV7r6d+
	 Sc4aQhmdwdZSkS3vtvEHTAPUGvcFFPoRaV6hXPX6O1h/eag+IAU5RdR9uVzG2wxS50mAY
	 g3FdPBFCL7Wb5KEA9J5jqig1aLNRCBPGLUF/4DntXTAUcQRGogAPEs7IrT4TQfETiHd0m
	 jyKxc6SktwN74jJ357Tk9CEtmUgWjei/wMKauZzjHGppoYJunGr+VO9ZVNlp9U0VgxBU7
	 Q2Nt1bLL6xATopmsgxd55Gl2pueAa4XEBRcl2OecLtkmCLvVnSwXDJCeGRNR9TufPPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="J8lnH6T/";
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DF160A2639
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63DF160A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J8lnH6T/
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f05bc71e01so10498095ad.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 00:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795421135; x=1796025935; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pu4yypJl6coCX7FrhDOYrF2bQ4S6oHs6DmVHvAaSKII=;
        b=J8lnH6T/iPoKZQTYPXS+7m92CxkIDbF3kbq1rFBp1sMhB+DMCya9n1m+zS7AdtfcU8
         +4ugcIKOF16Wzs71XYDG99Xl3+AiP9ozh9H8h3jvdmFsZ37VqF310KOgGX9K/QeMEZF6
         1b3jD58aotCBiUfOUFG1A6l6S3GdpSAE3lF0FwfAXMbJDp4PUPvzDuIYytcpU+thySZt
         HayFkqAIe8rgdVssZ95SPVMkX1RGdL7K7shqWxIRxT6stBQLiFPy7vSe4n2qLCSgRTdl
         4nDAqz/tc6Dp9/0KtDEFP8nkQ12gpUwcxYZPICf6dvVXrOfMFHup3YqfJlyG6mGPrfnW
         NEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795421135; x=1796025935;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pu4yypJl6coCX7FrhDOYrF2bQ4S6oHs6DmVHvAaSKII=;
        b=zevL/LgyRggdqFBvlH0MbbfaH8fh/dyKAftzxElK0a5VZOKK0zxVX0EVOXljVAuweN
         aze8BsE3XSJjN96qWJ0mpvBSASsk9xxFx+x2HE0PfxXmZ7pAnmRd6DOyPT6HAX+xn9uF
         UZfyiNNzWj0eOzwh8ct3oqYVLAXZeYQG0j8zwpD0XS7on7EfTV4CchNyKlZCh9BC2i+M
         7o5LE7rvhPgRl0rhbO5x1EDqYSOSgJdbWkUXXE0xdjJIP4BkJt9iNwIqUaD7KQ+evT5P
         Xi4+jxJO11a6vmm1A69bxzVlSTC43VpxKK4ljNBIiSwT+DlmARaN558mA5lZQXbHJjCb
         C/UQ==
X-Forwarded-Encrypted: i=1; AL+hErF0z7bS3Yoobqn/54b8x/GY6uLpiYANodQXhhDLloN9XAd+jN+qPck0grWCgkKrnRTO1scyS5c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LVJerKtqtaudPm6TIHuxOUKonh8s5hCOdvoC9+lzknvWpqxQt
	6n4v5R7N1rBel2fjgSQro0Up1qvE2wAaMhVGCB/9aPpvr9EZ+iyQ1g0m
X-Gm-Gg: AZFdTZdNEEycadxZ5+88cX0yq571XXP64dXbYOZfmQuci2DAoFdo43SBaTqjUeywMnn
	SihX6TtQDeBueuf0j89Zo5OqpJ4C7ATsL5hcbfyzdF0x4Jqsa5lJVLI4pIuweoNWEoAUCZmRuLv
	OSv6Budnbwg8fVCdCaBMUEoefDBQnaeEK4vRt04W2ebyD7meaHZBx8Qf2D7RnFzdYpedrbAA7KN
	MQR9bClLBzf1Y7CjzFnMq1LdmtxvkBJwPkkjtSpP16bbG+YTYuGkYYpvb4YhBucbPRdcIqR16QK
	lyQAVR3YfU5gGhJcl3zqd7LsWuUZxHGyOotiZhv0OOvyRMog5yQHwNXMV8Ujf6+FErjJcnNqcb2
	1au5fJ+MT5RDNSBJWqlvCSI9PogjLJELgReCwgweYgdSAhjOXex8waF8mOMeZ40hCAI6Al6HzM2
	3CKp9N3IVru6witHUyZg+2lPk11s820nCiqEtzfPuPskLJEn3x6MwRDdqJj6xD3LuYIVXqUbIBw
	xUThXZ/OZKYogT6D7z+1iRU+lLPDeydyg+VqaM65W6aoshmM1q+55QhfjHAtzB3nxTsJJk=
X-Received: by 2002:a17:903:2b0f:b0:2e9:5175:2eb with SMTP id d9443c01a7336-2f03ef3d695mr105076155ad.1.1795421134729;
        Mon, 23 Nov 2026 00:05:34 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84425sm49848635ad.6.2026.11.23.00.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:05:33 -0800 (PST)
Date: Mon, 23 Nov 2026 00:05:33 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Xin Long <lucien.xin@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jun Yang <junvyyang@tencent.com>, linux-sctp@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] sctp: auth: NULL asoc->shkey after a failed
 SCTP_CMD_ASSOC_SHKEY makes close() oops
In-Reply-To: <179540440300.3135.8565987128928534228@kernel.org>
References: <179505710266.3511678.14017674052424733262@gmail.com>
 <179540440300.3135.8565987128928534228@kernel.org>
Message-ID: <179542086425.3214459.13730708805653555091@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 23 Nov 2026 03:26:43 +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: High]
> Is this check enough to cover the keyless state?

No. As Xin suggested, v2 and v3 replace this approach: when processing
the INIT-ACK or setting up the association key fails,
sctp_sf_do_5_1C_ack() now fails the association with
SCTP_CMD_INIT_FAILED, so no keyless AUTH-capable association is left:
https://lore.kernel.org/netdev/179539544818.3016044.13738712075053349592@gmail.com/

The I-DATA key selection in sctp_datamsg_from_user() is a separate
issue; we will look at it.

Kyuwon Cho

pw-bot: cr
