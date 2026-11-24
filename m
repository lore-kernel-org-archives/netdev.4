Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795563534;
	b=PQE7V0+1a2zYRKLleMUV/ZGDPHDN8ntpOk5XYAAWPyo/hVTR6G6GZyeMEhsHqQGWYJM8
	 AOVGMKsw4lIS2sY7NtkmVmUN+DnHDeltwKtpWLmQKpzlIH8+AE+GP2v0ZZDzDkWRfHn3k
	 djqVTd8fln0Xn50VeBbYZpFi+Mm3flEWreG8nn4cyNX4o3/e1N93wJVx4nRZsFS6qRwJN
	 AmxA07eIpYLgPV+2K3C8MpKRbpDABBrZqHeu/fFnMhp9IZiTQJ7UH3Znnl9fcny/bT9+A
	 zRa3zvIL9aSyL/oQdewKhsEVeVfalsCM/EvgSB8RoRFDbphqqPTQmMGzDd1YNDQR/2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795563534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=DSz47Xb2Yu074okaoRlTthS67fhUdvqRS66Ctj90ArA=;
	b=LA/XE6ABQe7yWn2fUTFiA1NgBS0/IbDWxqn0Ku741VRzJaXLHPKBFGoAJdYuyCMgbC/9
	 r7Ybs+odARqvpFlVqpIP7Cr9dwbTza2M2cvHWzjpflvZ2KcXFPL3+Z/wlckBrwljR7nEI
	 ogMwXxSNQSjqRfW6p7sx2eJVapB+IW/IJF+qyi2kO1E4PkNOPukQYIFaFAHQ4/dPfL/5l
	 yelqsUfXUnQIf2aG+y+ukWmE0udS/2BoFB3WVHU/CeagPiywZmSBH11G2Z6rsuicOGyff
	 ofu3GZo5ytqJBecZz1OTAnljLIiXPjXAoqfCUrfl2Ss3s4wSxb58WRfknwfbWZLcUGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0c49RfFi;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29469606A329
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 23:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29469606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0c49RfFi
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso2581815a12.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 15:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795563533; x=1796168333; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DSz47Xb2Yu074okaoRlTthS67fhUdvqRS66Ctj90ArA=;
        b=0c49RfFiXg7MMM+V5ReJSq/A1x19TeDfE7VYQIbwrsJHOILZPw9H9slMQiUCntCkDX
         s+LI3kIDp/a474MULNg8So/YKq/2DINHMrgVIYAp7bLi/EQW/f0Y6ZdEk3zRry9f7Vp+
         kKRtvl7Wd4Lq1/n8PEe6IWOW77BVNhNvIGyB3N0iczBvsTDj8sXjPbRBExDxqoFEo7i0
         5dLUofgD1b5zJpTz4rwli/uicHWWc6d4ms1meAjyrxz+uLBsRbHeHMip8+5lv+1qV9St
         qZONviLSW4iNSkTyG/NHgB/AJ1McJkBtc1zN1X2oGI3WXsaCpKAb5y0AEzTxWO0apGM7
         XBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795563533; x=1796168333;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DSz47Xb2Yu074okaoRlTthS67fhUdvqRS66Ctj90ArA=;
        b=eVUufT99K01a414B47G3XJAIgm9u7oerUAyBJRgRlBZDo86oyxPgltwdieNj+vx4mi
         8LaaZdQZdGEvm4ZzEGgAaByBZlJTBKJ9V0eIZm0sl+cyYhGL9HtXMr6c2ZfOtUTDY3JM
         OOnk1Eq7wuFbxM4pPoCTshSlSzCkGasQEhT44N1HQ6nwgwVndCimtKMuzkaA4byku10e
         6Z4jwCP2r1dkPbDcFcZAfsz6sPWUCdqfXUv2KyNimfmtSm++MTEeivPZzXO1NvU6OcQP
         sSSwMxTNxbaPPPLQQdG/zSHElFV+RXOI3HczUHhMO3HClRWeviLMPX/Hury4/RWBCy7N
         pTug==
X-Gm-Message-State: APuU4Z/q3HkBnDu2w0IxWBtudILWs8z2Aq/Tis+/e4/NX65Pzu+ewM4F
	yfx84HUKxigm1Ae6bZmhMrVL/+MJbI+FfpUG8tp5Y4bOOpqvPNs83xws
X-Gm-Gg: AZFdTZeLeS/zIFooVeJDI/6I/yqx5We4FjuThL49RgisADqBwqkpNwB9gPT64xsaP0u
	1fwZfFGKnk2BYi26vJR/aIQRUpLZpS10aZj0rEQ3iFyI0wbqFoOipf7zhdkNGtWCBIEPp4fD2Tq
	I56gpJu9p2Cq/wq7hJIWAU6m90LytvZCv/DlsTPmY8hkzZ6xSiHe2gbk9hNPJy/UyPctB6zwZbv
	90ZV0H41dKNl7fj3qoo3kKrnP1pbkj36q58c2IDyDNwYQnNqtptXRUFYnFkwZR3lXx0g+J/f/A6
	iZbGSpsmtehT2lBy7r2yvA6M+d5/7bjH6Sp5P5Z17PVvTGbelzzmeIltCc8kWTfKW7YP210lWE4
	MEmbURntI7Uz98SQoHtVgcTlSZBMijHUxG4PqO7H5AEKvq5txgh4sc1mEC+7xmxfE+xzBkYRx/f
	5elVr+vZhcjBXLMnnZ3D/LoKZpyIDm1y/yzZkS1y3D+XFSoS/sARhfueC5iQfv3b/RkBicauwCv
	Lg6BIIt4lnawfwyd/h3v0EGa6RWHzhkMwtjaWCcNozB3AkCN0qELveuP86hjJtPw8OeqM0/OCn+
	//ue9C/VbzcDB4BPRtKz226DrgCcpSG3KNAot4MfvD+cwM2GkdUJUovD9IpApNlNY9JCnHlGIpL
	LpnuiSzGK0lMB7/b/3mjxocnNsp54BC3vnA==
X-Received: by 2002:a17:90b:5346:b0:3b0:9976:c1c6 with SMTP id 98e67ed59e1d1-3b41c9bbe00mr13922397a91.66.1795563533461;
        Tue, 24 Nov 2026 15:38:53 -0800 (PST)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad48786sm24744948a91.9.2026.11.24.15.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 15:38:53 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 23:38:52 +0000
Message-Id: <DN3U5FE54DYN.2WDV9ZPB6NWXL@gmail.com>
Cc: <netdev@vger.kernel.org>, "Jiri Pirko" <jiri@resnulli.us>, "David S .
 Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Willem de
 Bruijn" <willemb@google.com>, "Simon Horman" <horms@kernel.org>, "Victor
 Nogueira" <victor@mojatatu.com>, "Po Liu" <Po.Liu@nxp.com>,
 <stable@vger.kernel.org>,
 <syzbot+0054fed3dc9085390f51@syzkaller.appspotmail.com>, "shaos"
 <shawnq1@163.com>
Subject: Re: [PATCH net v4 1/3] net/sched: act_gate: bound the cycle time
 and start time arithmetic
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jamal Hadi Salim" <jhs@mojatatu.com>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <ACT-WEXM.v4.r0.20261124074514@mojatatu.com>
 <ACT-WEXM.v4.r0.20261124074514-1@mojatatu.com>
 <DN3PFJ14HKX6.1W8QEBXWGFTHH@gmail.com>
 <CAM0EoM=rNfC8O0+XVBTaCFX-NNf9TGp9scdETqju18PVaG=_dg@mail.gmail.com>
In-Reply-To: <CAM0EoM=rNfC8O0+XVBTaCFX-NNf9TGp9scdETqju18PVaG=_dg@mail.gmail.com>

On Tue Nov 24, 2026 at 11:31 PM UTC, Jamal Hadi Salim wrote:
> On Tue, Nov 24, 2026 at 2:57=E2=80=AFPM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
>>
>> On Tue, Nov 24, 2026 at 06:12 AM Jamal Hadi Salim <jhs@mojatatu.com> wro=
te:
>> > Conditions to recreate the bug:
>> > CONFIG_NET_ACT_GATE=3Dy, and CAP_NET_ADMIN in the initial user namespa=
ce:
>> > tc_ctl_action() tests netlink_capable(), which checks init_user_ns, so=
 a
>> > user namespace of its own does not help.  iproute2 parses cycle-time a=
s
>>
>> Well ...
>> after "unshare -Urn" an unprivileged user can add a dummy device, clsact
>> and a matchall filter with this gate action.
>>
>> That check covers RTM_NEWACTION only.
>> RTM_NEWTFILTER creates the action too:
>
>
> True - based it on poc i could create; should have checked that code path=
.
> I hope the over-hyper bots dont complain this is "high" and have me
> resend to fix the commit log.

Oh yeah. don't bother. small mistakes in commit logs are fine imo
(at least we don't care in bpf land).
This code will be rewritten tomorrow anyway.
