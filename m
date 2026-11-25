Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602656;
	b=Kn4I5v0yqCrPxlD4Seq8lwbfyFUPQxFxldNoNx5/YS09+3twHYIjYeQtq4mSc9uEu4RA
	 j+iHmlWoKUauJYOoT5yW29V/VZAtNZpPAi2ZAX4c3KL0jUCOle0mJ7NNuopSUNxxn3Z3L
	 zu3PvZYnB/4VwasYgZbI/r2DmiRCp3x78UPyncifQcKsFeX8ASUXyfceOvYpTRH5qmItc
	 3H54tFcbXWIeqO2YRgroXhXZNWurbDyszsmHTckEqDDzXi9+uaSYpW7xi3oHCuspxrN4c
	 2vlKzamBvJ152zhRXT1vDVkO3rRkL43Y3yD4/u1icCbfwn8B6aJXcfs7DGd0sZIt/CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602656;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=mHAFyVPNMu1mR3/ndYyMQe6ewIfFBmDnNddzYhNNHso=;
	b=j7yykL5ajTtlt4+q5Cd2bbuLMUnwlpMlVHNyaLt63xGTKgcpa3MbsB1+vdU3yFINKjV0
	 mQ8mDariDgMn7ORZ4xcFHmrWWKTB3F3FKAzD1/jgQDEgVnzh3U5bcbkrTKIAt/QjCzX0H
	 S4ZhLYzQve1DWo6yMvpFQ5RwUN3mu1jXA1BBpvPkSo0pWWmKR5IGwHtY7D/j6Q0nVahud
	 pJDH439ZnRgNvK6lQ7JIPNuMYyEMrl5ywlaVQhrTNGfHzxRPuGkRiG+uHayGEwf+UPjt8
	 LyPTYGIRITdkMyfzjW6sTXwRaIsCU/E5gRuyJqimgx5W98ZI4pWim3WbkN1x7FU7CAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QDUau134;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="qVGE/nQK";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DA8606A329
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22DA8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QDUau134;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qVGE/nQK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795602655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mHAFyVPNMu1mR3/ndYyMQe6ewIfFBmDnNddzYhNNHso=;
	b=QDUau13483ELbp9RQqwGesp6GZuYSLOBAqU6Io1ObP+4KIr5Fl6aRLmaPEX2N10va5cOml
	rt5Bg3Le435n2Ti1L+gw/l27ajyyIqkWtS2QRdA/ys0Aqi1us4o7U+YuUxnHcxvTICkChj
	fKuBURVFPuBs3WOX+lb2saISnokfKZQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-CT_qMhVHO0G1HrA2yEX4Xg-1; Wed, 25 Nov 2026 10:30:53 +0000
X-MC-Unique: CT_qMhVHO0G1HrA2yEX4Xg-1
X-Mimecast-MFC-AGG-ID: CT_qMhVHO0G1HrA2yEX4Xg_1795602652
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4bb8ae35aeaso47045205e9.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 02:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795602652; x=1796207452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mHAFyVPNMu1mR3/ndYyMQe6ewIfFBmDnNddzYhNNHso=;
        b=qVGE/nQKQNkFHj2z4DJMvIX8x7S4c/Nroy9h0y2kcXeRZ/7joy34WuKgrGd6W7VwXC
         TaNRNtY0ITPSbZTp7YsiWAne8oNRVzJU9H821WZwbyLl1f7eAUUIw+EgOR1AHLwg4iwf
         3LvcCc2krlupguXTkUylvkQioot8x/JNMNBGWIUVZZVEUOuwiSlwegjmnuWOQioHn3cg
         e1r/WIIAYOLozxYAQHL2e28WWo7HVo1fOB9GayoxnJVgvs/7bfAwK3aHkwSdGu81I12A
         gEicD3rEoILEvtvqlruRR4WZDj/mLUt4EotYzcOovWlQdi80SG82uQcK2caoZIM7HJDp
         mCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795602652; x=1796207452;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mHAFyVPNMu1mR3/ndYyMQe6ewIfFBmDnNddzYhNNHso=;
        b=r3gYpIl1oH/fO76grRbU9Nu7CqMhUetssTk2FGVIOJ75D7H6AZXRuTLjFDwPDrr202
         gMVZdSROCo7Wrqiu+0Slm4TuNoRBOKZtdzJoaa26pg/FVasJJTPKikimXfwDKkK/7OX/
         R9qRJL210oniVzMZRr8TR6hT4kxUD6YdmZ0e4Nmj5QyWDeHNujjEwCaecyv7XwmTR9d0
         XuebCfs0cG8C81fRKx2DNeA1iZ3FPrFHAUR0xNhTXgEvm+t9zqhGu3ZsQ5dg/SM5F+HN
         o6M+0o/4CU0WBl1AtdK8Z8iFxZU+ho3OzlFc+tBiXl21LdsHX+WkSxChdRTVG+MtJX3L
         UgSA==
X-Forwarded-Encrypted: i=1; AL+hErEkvFnoX7IV4M924V/I+z/Qd2Urownwk4hx3wnUobucP+3VQ7u+vjcVOf7u3wAVlKmudJ4X7oU=@vger.kernel.org
X-Gm-Message-State: APuU4Z94VAd1nk1Axtk1OWlzc7nNCrr6kTHh9CDaHvWbyPbohZ6YgKBB
	p6mC3/pR/fpS5yoSpbqRhb6keMx0BTtzw2emdC7dssku77z2L0zFuclSpe9ZBnSB3uW9+eRbo6Z
	R+jbERa6ZxW+otbJaJlq1m3UbBfkDSsB5BR2H1JWCKT58m89gK7iDjhwifKhj5BY6IQ==
X-Gm-Gg: AZFdTZdr8Oux4fDlGyaergYuRtbWLoAy5wZpKVBKikpLfpHS8rWJPZDIEmVb4v0Nhts
	pnF5Ji2PtBNxBobhiQYI892Q9CEgBjFWImAhRTI7xIOfOGxiyFpXV3Af8Ru/bGBMsNmE3UYmiXz
	cnWRbIIvXsjxg76tQxZqMXXQXoU+5BCHn+MyypwlK1UxrBhTrQ8yLEv84AdN+4xCorVg/FJ8K+M
	YKdeBgTV+qPwMpcxTzDkxpxYx4KHA2lhP45EJXA8MoKnc/Mb6llcei9rqxzL+VZHyPqsgBLBVeD
	uBhxbcUyHrD//ZX7Yyi/lnrJEwZQq4/1Id0kpCp07yH+F/2QglUSVDROqdhXDsmJ+Rx3rByapd9
	xpvn465FdZ9iNkkji872Iqap9mM45Rpaxm9UHIZfboaHxz07D5TwJJhZlJoe1ayEc1loWAT7qVi
	E5wB5A+VfaG6AUEZ9+OmtILxw5Nv83XfInjWJh2jamaske
X-Received: by 2002:a05:600c:5306:b0:4bb:6ac0:6dc1 with SMTP id 5b1f17b1804b1-4bb887c994cmr353098965e9.2.1795602651686;
        Wed, 25 Nov 2026 02:30:51 -0800 (PST)
X-Received: by 2002:a05:600c:5306:b0:4bb:6ac0:6dc1 with SMTP id 5b1f17b1804b1-4bb887c994cmr353098575e9.2.1795602651282;
        Wed, 25 Nov 2026 02:30:51 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm31264338f8f.34.2026.11.25.02.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:30:50 -0800 (PST)
Message-ID: <09c26dab-505c-4126-b45d-a2128b0755c4@redhat.com>
Date: Wed, 25 Nov 2026 11:30:49 +0100
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
Subject: =?UTF-8?Q?Re=3A_TCP=3A_RFC_5961_challenge-ACK_budgeting_and_unpaced?=
 =?UTF-8?Q?_RST_emission_on_closed_ports_=E2=80=94_lab_measurement_+_consist?=
 =?UTF-8?Q?ency_question_=286=2E12=2C_loopback-only=29?=
To: Johan ter Mors <johan.termors@gmail.com>, netdev@vger.kernel.org,
 Kuniyuki Iwashima <kuniyu@google.com>
References: <CAPM+r-+-QVUkh5JmSP-Ud4G0fExM_=dp929NXCBZhqyLbbuX2w@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAPM+r-+-QVUkh5JmSP-Ud4G0fExM_=dp929NXCBZhqyLbbuX2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/24/26 23:49, Johan ter Mors wrote:
> Hi netdev,
> 
> I am running a defensive-security evaluation of the TCP stack (authorized
> lab; all traffic between my own namespaces/loopback, kernels 6.12.117 and
> 5.10.134). While calibrating the RFC 5961 challenge-ACK mechanism against
> a blind-SYN storm, I measured two related behaviors that I would like to
> have confirmed as intended, and one consistency question. I do NOT claim
> this is a bug, a crash, or a memory-safety issue, and I claim no
> exploitability — this is a measurement and a design-consistency question.
> 
> # Observed (lab measurement, 6.12.117, loopback/netns only)

Why using an old kernel? You should run the current last release.

> 
> 1. Challenge-ACK levering holds. Under sustained blind-SYN pressure
>     (synthetic storm against closed ports, aggregate ~500 pkt/s in the
>     calibrated run; levering verified 100% up to the raw-socket EPERM
>     gate in the high-rate run), challenge-ACK responses keep arriving —
>     I could not induce the challenge-ACK latency degradation itself on
>     Linux.

It's totally unclear to me how many ack/sec per socket are you observing.
Since 6.0 challenge-ack limit is on a per socket basis.
> # Questions
> 
>     a. Is the absence of a shared band between challenge-ACK emission and
>        RST emission intended policy on Linux (i.e., Linux deliberately
>        couples neither to the ICMP/badport-style rate limit the way
>        FreeBSD's badport_bandlim() does)?

Intended AFAICS.

>     b. Paced-mirror experiment: when we pace the RST/challenge offer down
>        (7 tiers, 32.6-2086.7 pkt/s), levering is 100% at every tier — the
>        same experiment on FreeBSD 14.4 shows a hard plateau (~126-138
>        responses/s). Is any pacing/bandlim intended for the unpaced RST
>        path, or is "RST levering effectively unlimited by default" the
>        documented/expected posture?

RST on closed port are intentionally not rate-limited.

@Kuniyuki: please correct me as needed.

/P

