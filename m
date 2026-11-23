Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446922;
	b=VOsO2wrYHJIJ4ZwnC1yhKg4d5l3GH4xZ8K6Yp7bzI2hrrWjCNyUpBR2PRnDlbwjRAf2c
	 9SLplmcCvQZn606EDvbh+kCHVCoCE4jyfDMlzwozW8Faf/KbBap4QAFy1acAbBDZwx04o
	 iZKDFGm8ieAox/HRj/ac+d7ghW3Muq+2IFBdNz3+Do+feDEiNa+D8F7HvfUJ7g03q5uKo
	 fsf3CKvi/OXWSkF99d/tyWqpBf8xF9mMpM6ppb6y6JvSuRqk240lXY0iiAPcGU2Qpe5js
	 JfQy+CsdND8hqXmmyzKxd+tULtcSEeio4a7NhwLrsrXNAy3C/njM+aVcZu/2o79gIvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:CC:
	 Subject:User-Agent:In-Reply-To:References:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=CnlaXsnqBBeCleb2qSsHaDLf/DmVepUOVtOJ829eUng=;
	b=h3+ugh/ctR9tDjMhQ40HekZxYf86kxqERHcnb2RSZttD8BhimPiwSzEI8goj2huDEzfE
	 saQX9ysctG9gkQOaWsPxsnwNfkXDoFBHEc2sDRo6VnOqpC6DOZd4kp5IIgcd/Ba2WRc7q
	 3jt6x5WqFPNQh5my6Dxbo97T+9XzXv5bUGzFRGr85r3QgIv4Hj8dzoIZywGfhgZnykhJW
	 gtOdWOgtPe5l2GWz4/pPTpd416TDnSWwxG3jkIC9HXOYaKes3HU/8e2DBwSHJXtNFsEOH
	 M6GWy62vWMVKCan9vw2k95m+3wRJYSNne1dxxdHpql9LUIILTtRRG5SYe2XVItAjNng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="T6hWKy/x";
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092A7606A31F
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 15:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 092A7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T6hWKy/x
Received: by mail-pj2-f6.google.com with SMTP id d9443c01a7336-2f0a42f6d3aso3187955ad.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 07:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446921; x=1796051721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CnlaXsnqBBeCleb2qSsHaDLf/DmVepUOVtOJ829eUng=;
        b=T6hWKy/xMUz8MwoLkELtS0PjJMsdVpnQY0hdimf28bdMDuwidkZQin2ew5WaeQO11B
         Td0bpWL24IzlES06FOxMa3EtWc4YGjvmzl7ZF2VdX8DfQAO9AxepeT5b78EF4pjbmDDJ
         bUFfW0D6aSvInV6fsqmEKlydsom8p+Vmvg6RY8aGNG01ATBOZmPfsXKLW3j8l6y8+FXY
         +P5JgiPhDydh6pm5JQSWZ1/jOJ/GAxX2drCBy8cNFeTaNb7HWwazIFu34moHeW1KEyDh
         NdCjLzV3vHP/44CFO1KoswaTePaZgDwuLygiRJJOwa4qlCf+RpMmAxNMWm9C/TABrlsG
         8M7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446921; x=1796051721;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CnlaXsnqBBeCleb2qSsHaDLf/DmVepUOVtOJ829eUng=;
        b=OZdVz+VrIjmCPDUUK7aUSmKrRFRFjsy4lARLVIYiJxO9jm1/vN8K7/j0HZuOgYUfD5
         2ZYnvzTIWYwnEYrTR8VKNaxROC8VSn5yl1aScVrUG1WMlpKKIlNhGhhEhtr6v3rW89QJ
         VJ5nUBhnc0PuCtVp4q9VpzwENQMXV7uM6g7gzzi3YF+wMD6aTbss8xZrNqPHz5gxPZxV
         PiV3i0ZU/sHoUvyKO1eq0hLCehjPz0OrX08XlQGdbmMvGhu86uBkFnxYUimJBYmLyCyL
         T56Q4Ncc8fitaFeR3vw0Afu6k/XfKK+rilPhQ9/4BNRCcqugZ2wLkV1c/vxyS1/TNoEG
         aMNg==
X-Gm-Message-State: APuU4Z/LOI51cIQJySmHaMDTdGxAx/fpRyaa+iHPbAmVHxqYCbSmnnGe
	WSs6TxSj8iIKtCvD4ilr8vLiiEqwHMee490X8EEqFDcrMrVa8Kx1ZDPT
X-Gm-Gg: AZFdTZdjUR2OLjuJcpz9Sm4oWB3UOh+hkEoSQuuQRRdrEW1tmC+iHtxH/8sWJ+rvK9a
	MzP96SxaT/OGlc2jGEw1KAp3EAqnmZwlEr/J9FHPDOCdeQ8OUWeRowh7t4aeCnWw6jAntnY4Sr1
	i20U6zkfHIsR3OXpZD0yjdAREvc1jQr6da3Vbz8/3ffX6Tzu+bcrHEbaPEBY9u9VwMtTSUc/xZb
	HoLUCy5y7lru7eTj64jvuE2LvbgM3GG3KD+N0LWN7Z+l3KP76DlOy0NqGZ5qVr7dPDJzrFqbvII
	INK6UdKz6Iw4XCZoz7wZAeZa/rMU+q582xLH0fB0a+icsuEEBeQcnrS4i7pE5lzYmTs6Wzb3n2N
	YvAKoPKgdaIb/sGTSH9nrPypyosZ9m8p3CLA+s+RCoE+jte8z7//iGhhVQHzxfzVMjBi4HhGTmI
	Xtfm/R8h2dzRG10fALXqLxu/5uPtwDOW0qiGsBacBezo5RXLEJ1ZQWMGbwf+NKLoJjEtu0oyCSE
	QeU+pZlhhDbS1rEuCLGSHRk2TnEy5yKOlLzuAziwRDXlsUduBgT3E6/5oiB/hi1enWyu4Zr6XB/
	KIcpTFbaZjY4K/HNukg6n64mCaHks+ceRxtQ2f47mZv65Cppv2NL3Frwhha1RLinuqsj2ms=
X-Received: by 2002:a17:902:e847:b0:2ef:e28e:8f17 with SMTP id d9443c01a7336-2f03f1dfb9emr106612855ad.49.1795446921225;
        Mon, 23 Nov 2026 07:15:21 -0800 (PST)
Received: from ehlo.thunderbird.net ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ed3b3c1sm57050995ad.0.2026.11.23.07.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:15:20 -0800 (PST)
Date: Mon, 23 Nov 2026 23:15:15 +0800
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-rockchip@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_net-next=5D_net=3A_pcs=3A_xpcs-rk=3A_u?=
 =?US-ASCII?Q?se_cleanup=2Eh_for_platform=5Fdevice_reference?=
User-Agent: K-9 Mail for Android
In-Reply-To: <814be8ca-6fe4-401a-af4e-206f1b67be74@lunn.ch>
References: <20261123123052.578956-2-coiaprant@gmail.com> <814be8ca-6fe4-401a-af4e-206f1b67be74@lunn.ch>
Message-ID: <CF84A604-EB2D-44D6-BADF-53D85C975EB1@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 23, 2026 11:11:00 PM GMT+08:00, Andrew Lunn <andrew@lunn=2Ech> =
wrote:
>On Mon, Nov 23, 2026 at 08:30:53PM +0800, Coia Prant wrote:
>> Use the __free(platform_device_put) cleanup action to manage the
>> platform_device reference obtained from of_find_device_by_node()=2E
>>=20
>> This removes the need for explicit put_device() calls on every failure
>> path and at the end of the successful path, simplifying the function
>> and reducing the chance of reference leaks or double puts=2E
>>=20
>> Signed-off-by: Coia Prant <coiaprant@gmail=2Ecom>
>
>https://www=2Ekernel=2Eorg/doc/html/latest/process/maintainer-netdev=2Eht=
ml
>
>Low level cleanup constructs (such as __free()) can be used when
>building APIs and helpers, especially scoped iterators=2E However,
>direct use of __free() within networking core and drivers is
>discouraged=2E
>
>    Andrew
>
>---
>pw-bot: cr

Understood, thanks for the pointer=2E I have no plan to change this and wi=
ll
keep the explicit put_device() calls as-is=2E Dropping this patch=2E

- Coia
