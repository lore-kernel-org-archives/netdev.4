Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795826288;
	b=AhLLPwor1UAn3/0LIcCqIv0HqUiJryN5dX+pdRuEwlJWFN0dfM2EKZqmDZ7ck2Hool2o
	 UlCyNn2mqxA/MKDWQvSMFmFa2/2X9RxWTas9kJkGykhz5MAIFBCwDh9d+sdGPSvu+u2fW
	 Dl2VCxCSudo+NaNLKx4eJq5AXVBnAH3WLfmD2XkWKcyX8aFhZyhheygAqrz6JpMY9o8Jr
	 5QsP0mvuda7nRoOE9qYp5oT1kC0m00k9hq+8Vu27Jw5kMqQF/4vGQckvvI/FQvq8Bd2k6
	 4AK7MLAYRgk19TsjvYtBI+O0Vbi7KX82q9bTh39RtyoOrcfSznInikFQCHzectn60EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795826288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=YOL0rHwI3wzAxiSlMAGGk9NJU9DJm9wEtDs3FMJdkxM=;
	b=H0ub7tQp+mLFeul+cXxXjdUrB36xHaOmu1vWh5mjGB+aGqg2hFogCPjZ0Cv2HDY0GJIW
	 bIwqhIu2ph5RG6FPFntnyBZHW8D44A00Hm5YCrV6Y+75er4qSPGdpGNl/qA1GqP3HgCdQ
	 zg2Y7wYm2hG60PafiIY1rnG1xQT5FslRChktjcPHImQN57a7kZX9NO1Ciz+OykGvQe7WY
	 97MUzAzD0hikRT869wve1TSA9lYuje0UVut+KezfMPr5OybEoctoEwGypjM7q5c0bCHNS
	 6BvBAfcUPUJyMQ6V6WDuZ2fxAI78ceXHwThBY9+TtavLZ+QpfXobF89aWn7fq4YaTQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZKquqcb5;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43404606A31F
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43404606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZKquqcb5
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso7359095a91.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 16:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795826287; x=1796431087; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YOL0rHwI3wzAxiSlMAGGk9NJU9DJm9wEtDs3FMJdkxM=;
        b=ZKquqcb553C1STK9QTgdXfRyAWUuYTT0NYDXAbFNELVbvDZVCnsYPo1TIdFhNon5XC
         kg+l1yQya+4Eu5DNiTvrPG7CssM5yQFpVMgmNj5wsreMe0dXvFPd3fe11juBaBgNB3BM
         dMyd2o7qTGDHVEem/5/uht7ZikH591ADQjGtfG9unKEU0KzXTHrcutyDa6X8I0oiJckz
         DlXPu/49ZuqhLHOPnUDJG0VHqml3u3ymKLeUBnSB2+YPsEVQY8usntbthQCTds7BmZAi
         b2E/Q7QRhBklENM9luDICJmLTN2PM0+S3OaVARAWjToxNsNm8tSKk/iUS8DFcqzubrby
         SRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795826287; x=1796431087;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YOL0rHwI3wzAxiSlMAGGk9NJU9DJm9wEtDs3FMJdkxM=;
        b=0UbRdgRmQLDZPyHV39XWqDeiHUWdqPRbr0kzGS3N4Yz/2IvkzQEJInj/TIWNweqzZJ
         j7Io2lkQs59UVzEWzgKr1ND/BBi5ARTNqq+qNZaxn2Bp9L6cOx/OrB1CauAirb84KO4o
         SZegmxb9RSq2d7iu4O0qsa+7IeycflHrz/rwrXC47nyKiADarpu/qdg1uEl+sIoOxsdJ
         TT0mph1CSpJpP+MTijdH2Um5zgcL0FfbCAayHl9dpiec6oArBu14q2f6sv9lwyqjEx8B
         tksAYTi2kQx5b60dlyvfPv1SR1RxFRnQKtuWMNDL1q1C7ENZ/76sJEif/611p0FW05EQ
         58Bw==
X-Forwarded-Encrypted: i=1; AL+hErGKf+4um3DqW3/am92Uv885OmWydxoe64V/wz0P1yvUtT3tI6eyGErxf5qQG5EgFuSmYFyNC7o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MJz3oew98fV0TGktFvFOEr5nOdCslFKVgWbAGkJ2BkqglefaG
	X4rN05hrDZyORScW635QRpTsIcD5vFygekCslxuD1febYFqrrJG6TIoV
X-Gm-Gg: AZFdTZfRfbh6ql+qdO/Nq0rl5V2cqro1V+MlS9Wh27nkqiNbBuMxHHIBofwmB49ENBJ
	RoEgSq5yKlA3oxj/EkXhXQzJpYinX189AORsO7hEDbxV58K7abKxy8tquKERTTZUBITiMQtv7xB
	Ns0nuakt+bvYEmn0XutB0zwpFe790vhFsPOXOVEeqxv0n9nZDrEKU7juI56N6CyH2cmSU6Dm/F0
	xlhyWFc1vxrl6zPAKy6ccz9lRrSojhpwkxTFv8AXUksamRNhbZULD37ICEmL1/WBLsZjBMVvRo3
	sBfZHhkB1I6CIZrbPo03gvO5NEyNUD4nidjTglwF0I2jSkaen2SM0h1tY0rJ8o8uCBQauDa5ySt
	BsZfO8FHiSeGm7+ISTSmVUqDOkpuMygn6qZHuStG+W8U17wDrD1TUMqdbAgYVh2T/xWHNVc5ELj
	7LSagbOx/YW4KzKMP6KsA65ICdtMThBBVhhjMfPxdqIWIIPg9hx04eLboGfeXVtwvhxkamAlVwd
	bAXq1f7iu3cm54rtkRrngBGNU62no/6Obm0JTZwJu3JMsG3GxP5kMLeh6FRMKV7bS6ot7XQzCnG
	VZsIgkk5+V5NAjFhrzugPc32uPNdxb6Kjm8tk8+GqrQisx04iYni+77DNIoBN9qb9XgkREy0r3d
	pgS8qMWvfzMDZAyBOpkAZaRZqLFk8cBszdA==
X-Received: by 2002:a17:90b:2f8c:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3b41c93fac6mr17486167a91.30.1795826287365;
        Fri, 27 Nov 2026 16:38:07 -0800 (PST)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm42125157a91.3.2026.11.27.16.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 16:38:06 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Nov 2026 00:38:06 +0000
Message-Id: <DN6FAEWV4D25.2PLLOZNKR0L1X@gmail.com>
Cc: "Jiri Pirko" <jiri@resnulli.us>, "David S . Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Willem de
 Bruijn" <willemb@google.com>, "Simon Horman" <horms@kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>, "Victor
 Nogueira" <victor@mojatatu.com>, <stable@vger.kernel.org>,
 <syzbot+0054fed3dc9085390f51@syzkaller.appspotmail.com>, "shaos"
 <shawnq1@163.com>
Subject: Re: [PATCH net v5 0/2] net/sched: act_gate: bound the cycle time
 and start time arithmetic
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jamal Hadi Salim" <jhs@mojatatu.com>, <netdev@vger.kernel.org>
In-Reply-To: <ACT-WEXM.v5.r0.20261127063407@mojatatu.com>
References: <ACT-WEXM.v5.r0.20261127063407@mojatatu.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, Nov 27, 2026 at 03:43 AM Jamal Hadi Salim <jhs@mojatatu.com> wrote:
> Patch 1 bounds both attributes at KTIME_MAX and computes the next
> boundary with ktime_add_safe(), so an unrepresentable expiry saturates in
> the far future.  Patch 2 covers the accepted upper bound and both refusals
> in tc-testing.

For the series:
Acked-by: Alexei Starovoitov <ast@kernel.org>
