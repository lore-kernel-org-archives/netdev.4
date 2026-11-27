Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759037;
	b=BDp/TsXHalym1UZp4+4kIVXlCOn+WpBZUSBTEGAxpabiCpIJRwJh+tARo+9DGf23glmd
	 iQxTHi6qglV3DlJ/4rYJrsmjgnKHFzG4IXn80jtwo4JUEPTHWrbyvDuchyhTeCQACqACr
	 nlq3v9A4yEnh5JE09dSw+b/MtG39XXAvrJV8iK0laW3D3LhUHPL/oHNUv/lfDyqgt0gYy
	 iTFTsXkwXkX3GnR0z1PdiCMj8x0tQiplhiCC+SNXOlhoAnZCiH+RE2JhkxXEx8t+TzkWA
	 a6dV7zCoslbhb9LqQZKneVAmSwpgvRERy+gFQghJvVklYwKrTBzyWzhSfnkaXbtORiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:From:Date:
	 Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=+R/R2nJLO5cjd36BbWY3awbaWv3s9L6uqWVOFpPVHCc=;
	b=3AA6mAcez1//0pvp4PsXVmjwwI3oYBbmfmggAZZSbavmYY7sZtTxDZuEQWgJ/AjSSPP3
	 EHlZaHhEMc6JqiRXnYbnkqwCyVDuVNJcx6QTuVo8/ZuzD7FYj04X877pfZ4Y3bJ6Twmzl
	 EgeaVTVH16arHWOcfORBe1tscZWjdxS+7OugXLPXF6H0VPdeYbrG1Wf5Em25qbisjhHDO
	 XJuXqHib0pVfAZl2EU10Cius+DCykbQEjcjW0E0j1AUCZXU0iqZYqitVRff6VPBvgB7VS
	 emUrcA68zoHMl0bXw4SHrCy993ILMj2Onj1bMeXlwLScPveoSsNKjlYA3fC/YEavjjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hkQXCEnI;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4F8606A329
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A4F8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hkQXCEnI
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2f042b6ef3aso55428865ad.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 21:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795759036; x=1796363836; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:cc:to:subject:date:from:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+R/R2nJLO5cjd36BbWY3awbaWv3s9L6uqWVOFpPVHCc=;
        b=hkQXCEnISOOdIhfSmNQ+wti7aHe/TCsYuW3IUXyLmoEWAuISnOT6KyE+O2PpQ5Dcmb
         S2IhAWY2ARH9atbednkegfndCsIKn828pZYkOYq6FgkQYQpVuSGUVvSJ6jogd/bpTZ4g
         vmtIt5e306+jXjYQI4hF2EHMKoCRfVpdndccatFP8diVGyasUOeJN3GDSjb0C6yfh8sG
         9fCAxrnmQ8qvQt9C2iNJ8Yn7/boXQyW0FrJnCjKx3CGcdRGloCZ3YIZPZR1+hTfxe7dU
         gaNSvyORjVfjhC1wedfg+qx1Z8bOWhAhvjHY54PNlWoRc0Spl9/OK81CJxoq1xckjy/h
         XIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795759036; x=1796363836;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:cc:to:subject:date:from:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+R/R2nJLO5cjd36BbWY3awbaWv3s9L6uqWVOFpPVHCc=;
        b=wrm4gtC2Y9eL2FBTGSzvDwdCbOw2gpLQuWXRwN7eJ7XNkQIa8DFYlT1mTIFYsHAnDM
         2KL8uG5R2AxsGeAYLXSXklNJVtA3K52zFNtOwbWZf6Rj0+aGECpiS2sZnaELz2YyQ/70
         gSp1ukVx5Pkul6vF3EgN0/n74qZYZLjdZ3ITQrjs5Sm/r7E8gIxHoyc1FC55AdqABWIY
         aIrnKXW9o/hIfx9/1W7zrI+9JLNXUvTLWcuuENOTy4CoMTNCj66ySLhV2ds+roTdzWs/
         IBJbVssX/mVYereYvCnyQ7p/eBaRITk+/nw/FvFaabfMGcUCpCjJMtek/n7AhootqMOg
         M/yg==
X-Gm-Message-State: APuU4Z/eiEGSJX3SGbsQ7asbuxxuZfiqWm9fqvS3vQjyFKVr7FpZaJNz
	9jDibjXcgo6L0+mpuP6sKeZ1oRhImUwIWx1ZwZA6NMhhw+Mqoo+MCkon
X-Gm-Gg: AZFdTZdN7D1b+4vWK2HFkIb+7gRnEDNWT4WJiBj0CN2bhk+X4nPA4EpCJN7wS9t/8CE
	UgcI9xKlCqZ6DWU8F82ilwxHJwG1MToqb4QeJxP/WMEqRRlTRSmyVOy/qJEERNUpZ21ag9uBpIJ
	nbwnhKHtQc6nhL3NnPBKRjGZ9GhIOwRrkrjPUFq/xLG+hN2IAUU3pZZ4a0bQzYS0W7h13cavxUb
	rYdhqtgHU3HrN4UwxckjloRq98WVb7hDpPcQHcL8UBaaMNJ+eqhCgrcU7Y9hDVAEWztRi/tiZ2A
	esYDm1Potudk5LQUMfoWHrT5PTOcX7rdvOrX7XTcoTGJk5PdBkg4Su+rIn+f8BL6Fvz8sMUH+xu
	ROS0BNI8f94yaWByLZ6o9O3FaHs/ICHdf3yjCDKieLdP98g0gj9G5K+KLp6YURbqRAMMCQa/G+U
	00akH0QGXHNggwrQLJtDe8Ne8io2imqZwdyFiAa0Xoe3gn6wPbbP1hv7bJ5O3TC3dtRJBiq6axq
	4kwIbU3q8V5weJgHUa2YI8Th/wkAuPoQ+QYk/VFoef6EBazAuLGM00QTYrWS4OhYl7/Fz7x2Rma
	trXgcgSJckfBGb5n4yZcosZfYA1lPahwMzQoH+v6VahpNzdHFjtvWEnnyFeUOj3xVcL+hFtOS9a
	iZEkrZwy6fVzlXbIg8rkzFEk=
X-Received: by 2002:a05:6a21:3d8b:b0:3e1:aa91:7134 with SMTP id adf61e73a8af0-4014d46b50emr20040114637.72.1795759036448;
        Thu, 26 Nov 2026 21:57:16 -0800 (PST)
Received: from [169.254.212.233] (ec2-16-179-105-217.ap-southeast-2.compute.amazonaws.com. [16.179.105.217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077a058sm11926655b3a.8.2026.11.26.21.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:57:16 -0800 (PST)
Message-ID: <reply.cover.1795754281.git.n0ps1edzz@gmail.com>
From: Zhou Qiuyue <n0ps1edzz@gmail.com>
Date: Fri, 27 Nov 2026 13:56:01 +0800
Subject:
 Re: [PATCH net] ipv6: route: fix use-after-free in ip6_confirm_neigh()
To: Ido Schimmel <idosch@nvidia.com>, Kuniyuki Iwashima <kuniyu@google.com>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Willem de Bruijn <willemb@google.com>,
 Hangbin Liu <hangbin.liu@linux.dev>
In-Reply-To: <awjbaKiRpvUyHA3z@google.com>
References: <20261123133000.1.n0ps1edzz@gmail.com>
 <20261125190113.GA421469@shredder> <awjbaKiRpvUyHA3z@google.com>
Content-Type: text/plain; charset="utf-8"
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

Thanks for the review. I addressed your comments in v2:

https://lore.kernel.org/netdev/cover.1795754281.git.n0ps1edzz@gmail.com/

Thanks,
Zhou
