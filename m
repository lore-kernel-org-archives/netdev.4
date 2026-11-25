Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795614576;
	b=HauWtg2e0ky8UMtJVyYNarwJMSlKVAJLNH3LnikxYtlt8yWvnxen/gDqfGeKTBIsTSpK
	 uA1p5i2Ugak8Oxmp78Pnf7VE4MGb9PELvzEOywXncAxiRZFd+jM/JQJ6zzQsChRrELKO9
	 G0L8IUKuhz4DeJnTZ/B7Jp3gdHlk9voWZYkT7l2tYIHefQMEk8qvp6Mpt2uyPwiyHv2EI
	 bzltFj2UbL8xkC67LYm6gvmJEl6fU9hWR21cwhA3Dqpjlvt89pX0hM1lUs+yEdAAriMYJ
	 s/D4HPKwM8U5nG71fArjcvoW0Vra77Id29XX/857H7yO0J+3Lbb96YdwG+jModm3tDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=c5Jj0SHHH+2199rNq+OQYZrQv9xMAnF27D/bE3kVSOo=;
	b=3wNaRu7nv7SzapETT9vdF14HKIbGST+k72GACRu36MvzTXeyE5h5qQgvGhdvkofPbPnq
	 DeEIX9fNYPyU2rc6csyC3EsFVWOKoYOcZi30Wd6BGxYYaKWiQg25DwkFKuFZ+0LkK7UYf
	 Go9rfEtq8rEQQ3XxUwaxFSD707dJl8LBQJr+GSJZgr/QKqnUvhquIMh9c+VLugtfLPxSj
	 KWMtGZSnveQzvXV7tP7J/6Ugvg5SWWNKFYUcVWw/fhO6HcfgDLM+ylFWvLOTBoJPLAhUL
	 FcXOLzbU/nnsOZbTeSDUrq1VlX6BzWKMMqtq3kw07oRcZyK7YydhTwYRickM6Siaorg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I0zfAss9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4DF606A33D
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B4DF606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I0zfAss9
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c50737c64c8so56985866b.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 05:49:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795614574; cv=none;
        d=google.com; s=arc-20260327;
        b=G7It8G/vr7N2tXIr74ofY0wayT/fC9KrlsYhCcZ78IDCAb60KvWdZkkvFfAlXmlvw3
         t+xAl9BldAEl6zN9lu5gdWBeI1UNE7f8jKt/QZyQoYmNhiJa+wDqsCNCGmJdZralonHy
         XhykmjDgVJWUnYSBijwxT0UbWGXZukkG76yDsQTODg/C9odvNXOhbZ1PPd9mNNuscnaB
         lLxPxWKU+h8LJWX1nbw+tjxaHyQi2VKeToP0857SZTCcYW6Ej387+qahnBm4KCBB81Og
         j5N5suVXUiXp7KSdxVx2CpwUP4AQZGypTfs9JQRyZufJUQiYDhikwYnrWRdLf+oAxqge
         euzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c5Jj0SHHH+2199rNq+OQYZrQv9xMAnF27D/bE3kVSOo=;
        fh=MO64O7FT/OPfQBn9FRTJmPix1XvaBWBdqLbqndGtoUE=;
        b=TbEE7QllOFGiExiZJ9o9ze/guQgDla8BLd8azQXyY+pqbzXsJ2c8f91zHxDPIlX+KA
         f5JbXlS9ombTlB86R+zgrgIuNZ3dY94lot4jifOIM53riUl8EfH3xMwx56yej+M5juQ/
         v1E3kcC7sKjgtsbZaXorTHVWNBR8LpOyCLNPuZ6Lho9AnkLiyn+Ur1NGzQ2LK/mbS6i6
         UoH4kOXRdWoIMFkec1MAqFCOzEVDMCLzY9zg/OVLri8FNbEkHSrMO3oCDgz2MK2KzXVT
         oGnnZpF3lFqj24QlUsSrGVl0nwvdfmJjmJ9+dguuIpXWErvtg9OqE1kgbX5o5JLp+rFP
         wGyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795614574; x=1796219374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c5Jj0SHHH+2199rNq+OQYZrQv9xMAnF27D/bE3kVSOo=;
        b=I0zfAss933T2aZFzZOZeqt+KQGjS64WXuipW3lDFcjC3q2u9VUHAZ9hAdQkQ+OWfpk
         SDhsPi615KXwUHyTmQ8DT7XIXBZqUwB+cfM8wLIP1qbl8lLOAySsdhNZQfe2TDMIe1wF
         1PY1URlF7lJOSPm9lx/oJ3o0m4RlszSnXFQ575y4OWt+lZ29mCS2WufRwsFDNL8a3aIq
         ognNuxa3VK5kVqdhJ3VF/GBBGJDDlR6tK9E7yNzhbjHHn3PJNDfjFmZG1RjH3drh72NU
         ubXswZelAVprkr1i03aLmK+8KGWEqEA2eGMlLZol/SBWztj4dqlIWMDqupKPNpFlz5qZ
         5TEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614574; x=1796219374;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c5Jj0SHHH+2199rNq+OQYZrQv9xMAnF27D/bE3kVSOo=;
        b=hgOGEnMABUm9j28AR17oTHp6Pyy72HZ2TevwSRhB8iNO+2tZ0f47Ndx6NWtUax+x2F
         YXyZbcAz+gu5rsHHRRZVbl3FkZN331ni0tdhs54iU/trbm4ec4OB6iJ4rTUUCWrUCRGx
         jGzu9xlmGUGmAm7MZjfO3GLeY3eGsNijbJ8+qHuUmEFyVRz/syESY/RnjWjrqlWK2Jcg
         UFs9Y5KsHLNKtqiEY0oV3oi4ZMTaDWouqZR/xZVTBV2M14B54Qy4nk8HWN+bKHhap0xd
         MH7jByC5haD/w4FngpRlAHScIM+XSNh5SV8lIkFrFYgWaqgbCtaBMiO3FMvQzPGjMzjY
         upQA==
X-Gm-Message-State: APuU4Z9ryxE3gZmlzU3rJlPEiPi3/vKBkvpNZ6dIq3Y2o4hz2EmaYTmU
	0Az5IijGVreQL46w9FYOPfQZxwGnTJiwjWZQXhcOV43arMII061QOo0QsNxTdQsmE4ymIis4HVW
	c7bkbm9U9+YbmKSGuonnXnupC7gxEmLQ=
X-Gm-Gg: AZFdTZc6quM0WTRHx+Rdrvtn8nF4R6fnVFgXiGau39fPLxYKJFX+phY/EshhOCnew2K
	e6MUBWYf6CJeT+Tkyxnx02D9IUeOAnxCAzy7sMeBdk1U7ymSOaXX8Eb+cSFlBMPcYP0w0Dt3ajr
	//TTo46TN1076VOFLSmNsgB43TxyLHM/LyJTrnaTopFAftH00ET/8xgtg7EgH+xj0nLdDEjeL16
	FMIUDFIj0qJjqqRpBUqxwDs2PYfD73C5fRfE2r1jzg39JO94eavbNA+Yf0RDtqiyMS7VhvNHInb
	CqVHMr0ic1Z43I/lMKVQUOy5uj/z6QWHG6YULGSVfkdz8UnyXB1blL4ypBBhUHfMJr0r6QJh8uF
	oNLPhYKVtNXNKtI1N82E5jgvDPySje34z4BvWOIYmS+eahUWmLIxJJYoMyS0O0zB7afQjCrLh3C
	pu1tWWZ+mg4ogt7IBR5W0NHtbJ/dewkSaxS4l/bKB8jF9f4hgeLKp6hmJ1zAlPMMvE5batI6w=
X-Received: by 2002:a17:906:a11a:b0:c42:e6c8:e45a with SMTP id
 a640c23a62f3a-c513a5f7605mr1339666666b.3.1795614573695; Wed, 25 Nov 2026
 05:49:33 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAPM+r-+-QVUkh5JmSP-Ud4G0fExM_=dp929NXCBZhqyLbbuX2w@mail.gmail.com>
 <09c26dab-505c-4126-b45d-a2128b0755c4@redhat.com>
In-Reply-To: <09c26dab-505c-4126-b45d-a2128b0755c4@redhat.com>
From: Johan ter Mors <johan.termors@gmail.com>
Date: Wed, 25 Nov 2026 14:49:22 +0100
X-Gm-Features: Aa3M54oDeZWNTqYazfgPUeLFaDUTt3713b1FiE8TFL0130WIirb2FW1BpdxA08g
Message-ID: <CAPM+r-+-=3H1uN5=dim5O4cuFCWmx9agh88ERnMAN+fet7J2Pw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_TCP=3A_RFC_5961_challenge=2DACK_budgeting_and_unpace?=
	=?UTF-8?Q?d_RST_emission_on_closed_ports_=E2=80=94_lab_measurement_=2B_consist?=
	=?UTF-8?Q?ency_question_=286=2E12=2C_loopback=2Donly=29?=
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Op wo 25 nov 2026 om 11:30 schreef Paolo Abeni <pabeni@redhat.com>:
>
> On 11/24/26 23:49, Johan ter Mors wrote:
> > Hi netdev,
> >
> > I am running a defensive-security evaluation of the TCP stack (authoriz=
ed
> > lab; all traffic between my own namespaces/loopback, kernels 6.12.117 a=
nd
> > 5.10.134). While calibrating the RFC 5961 challenge-ACK mechanism again=
st
> > a blind-SYN storm, I measured two related behaviors that I would like t=
o
> > have confirmed as intended, and one consistency question. I do NOT clai=
m
> > this is a bug, a crash, or a memory-safety issue, and I claim no
> > exploitability =E2=80=94 this is a measurement and a design-consistency=
 question.
> >
> > # Observed (lab measurement, 6.12.117, loopback/netns only)
>
> Why using an old kernel? You should run the current last release.

Point taken. My lab targets the 6.12 LTS line (currently at .119 upstream;
my guest runs .117) and the host distro's 5.10 kernel. Both PoCs are single
C files (no dependencies, ~1 minute per run, loopback-only), so I am
rebuilding the guest on the current stable release (7.3.6) with the same
lean config and will report the levering numbers for both PoCs back in this
thread.

>
> >
> > 1. Challenge-ACK levering holds. Under sustained blind-SYN pressure
> >     (synthetic storm against closed ports, aggregate ~500 pkt/s in the
> >     calibrated run; levering verified 100% up to the raw-socket EPERM
> >     gate in the high-rate run), challenge-ACK responses keep arriving =
=E2=80=94
> >     I could not induce the challenge-ACK latency degradation itself on
> >     Linux.
>
> It's totally unclear to me how many ack/sec per socket are you observing.
> Since 6.0 challenge-ack limit is on a per socket basis.

I should have separated the two paths =E2=80=94 thank you for asking. The ~=
500
pkt/s aggregate was the closed-port RST storm; no socket is involved in
that path, so there is no ack/sec-per-socket figure for it. The
per-socket challenge-ACK experiment in my evaluation ran on kernel
5.10.134: two concurrent victim sockets, 60 out-of-window probes each;
each socket independently received 30 challenge-ACKs (A 60/30 and
B 60/30), no cross-socket suppression. One precision: on 5.10 the active
mechanism is the per-netns random bucket (the 2016-5696 fix), not
per-socket granularity =E2=80=94 that arrived in 6.0. I will re-run the sam=
e cell
on the current release, where the limit is per socket, and include
per-socket ack/s curves at fixed probe rates.

> > # Questions
> >
> >     a. Is the absence of a shared band between challenge-ACK emission a=
nd
> >        RST emission intended policy on Linux (i.e., Linux deliberately
> >        couples neither to the ICMP/badport-style rate limit the way
> >        FreeBSD's badport_bandlim() does)?
>
> Intended AFAICS.

Thank you =E2=80=94 I have registered this in my evaluation notes as vendor
confirmation.

>
> >     b. Paced-mirror experiment: when we pace the RST/challenge offer do=
wn
> >        (7 tiers, 32.6-2086.7 pkt/s), levering is 100% at every tier =E2=
=80=94 the
> >        same experiment on FreeBSD 14.4 shows a hard plateau (~126-138
> >        responses/s). Is any pacing/bandlim intended for the unpaced RST
> >        path, or is "RST levering effectively unlimited by default" the
> >        documented/expected posture?
>
> RST on closed port are intentionally not rate-limited.

Thank you as well =E2=80=94 noted as the expected posture. That makes the
cross-stack asymmetry deliberate on both sides (FreeBSD's shared
badport_bandlim() budget vs Linux's unlimited levering), useful context
for the FreeBSD report I am preparing for their secteam (coordinated
disclosure, separate thread).

No bug claim anywhere in this thread; kernel log clean over all runs, no
traffic outside my own namespaces. Artifacts available on request.

Thanks and regards,
Johan ter Mors =E2=80=94 independent researcher

>
> @Kuniyuki: please correct me as needed.
>
> /P
>
