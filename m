Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795616396;
	b=fQpG86NE+ow8dNtNb80wy81svhcJFzgcFZ6JFzhk1KI5QOJLsaokzCb3jDkprmcEH83h
	 SQUdAxLwlDjEfM3c12qI0B63A0wg5wfYv4E1QwWTNREVGiM5ox5qAuZJ9oef9pb6s1H6m
	 213RMdm8R6b0epg36+vZ/XPpAzIGP+YOluFfuVKuyECDV0n7qHiJXDEco4bCxNrWJpw5N
	 7rAyl8TwYkxbzZtb2vEkujlfS1HN346XeIGzYl1f5JupqJ+gCye3T/59JtwbAzhh5DMxw
	 EsJkerRUZf8gGa8XGVOZBIrRcwUn4JA1uC0ziBEZCTYX0xIO46TWXTelYEKH/B/N2uQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=WnR3vk2y0sTvUjvPy0qhotk3V03y3uemI3XFtyVMMug=;
	b=X+96QtHUuBXzVzbfBWMzeSRsTfkaZNaWflIMQY7S78qfwgfe4pRpmJ9MFHdlqDeEhv/0
	 GN5RrOt3xfFU9AZRlXONCBZdYRt5lmKvNmzq3uZxvblmDQNToYrBtfpFSJlNCg56xklKI
	 ycXxm/SRLoDbny60/u+WDVldVQw7/WNKxCt3pF10BYNVtGb2ouEtsGl5nYD+PFC8lZXoQ
	 XlE16S7t1TKLNNhuI5JaPgL2lNlnAulyJEFlnjuuTh1cVrTVsv0HCFznA2XoJ+N7+KxbA
	 5O5+Zlx32X8b7O5vwOHqN9DenGmVSS8fZ2vWdBInXi5cQM48Xp5SSPb01/Ka1f2a7KA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M7U53k+B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E752606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E752606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M7U53k+B
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c50c2be615dso46553866b.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 06:19:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795616394; cv=none;
        d=google.com; s=arc-20260327;
        b=p3FWtqSg04v+VDE96q5SkuRFblIm3E2nlLZk0c1PWduIOTv1wK8Vmb5Wm3vPw5PlVM
         XuwAiC/L1I/Ec8w5/xx24xxUl6mtj4fEBDhKxPZM2loPeIrgp4/gRMIvrhdELozKhV5d
         xXHSAQrkkkRuv0mR8nuc3q5T4Z5JoG+SZvTtU7jHb1XZPE6vDyTlRZYWes7nLxR3XVad
         mtilOZVAX6WlwuRETgTz6xQCRjZ0YjoIuovd6VJv4XzN4wfXJjHiWEb46NimGdRQviyg
         e9vrsnUzgLwvTbV6W5LWukHdRN/oImQ/FfQez70cWph1AgQvuqgpfcjuNmgMMD9KR/MR
         F5QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WnR3vk2y0sTvUjvPy0qhotk3V03y3uemI3XFtyVMMug=;
        fh=MO64O7FT/OPfQBn9FRTJmPix1XvaBWBdqLbqndGtoUE=;
        b=k1Eq0Rr5x+64p9EQzKGgsnHjA+nNrYvfIDXSpYt2tpIUSKkzRGOWPJPqGPiKfngH6w
         EZBqZfKRrixv0WxNcwf2qbXIBxGX4/RrtRDj3TU+7heThkowKSEPzweZWZ/EaqOFxpgq
         +JleIy9tUp0aiKTJNIJKCw3aSgyXluQYD37c2RQDSEgVO528WzaIzAPgHY6gkr9mWg5J
         1U1bCy8tGTcugrRP9CszipIFzHKR+p837SrCOW62PB6I1hc79WVf/FzLrVFbCSE3U5lR
         Y2jX8Wn60MRtAE/b7uVRxoh7x6J738VEjveSKIiUfWnpJ3N44H95uD4fxjnhGIRynEc1
         EBtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795616394; x=1796221194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WnR3vk2y0sTvUjvPy0qhotk3V03y3uemI3XFtyVMMug=;
        b=M7U53k+BFlQTNbWjJJemdvu8IfJp98KUHoGSYFKI+GcUhguTMQ/enwj81g7cM0+Fxy
         lJInGuUxqQpl3DRB3AKzpDwB8oEA51hYvRiWz1HNiL3UG0KbP7ozwcxBYWX/7eI+r0xI
         Q2EkmKavEZak/i/gA7hAFSlFun9pW9w3r1pOQge9iEyEgbqOKELe58Pfq1ZNyYvK2FOA
         +LDOCzNMLPKO5WqU0X5sZbik7+QLAe92kVjmvqQO/fwAVuPFTsaKebG/OIYz6Z1oo/q1
         52KOuD9qyI20j4T81IYc69G7wnCdckqwIeVvvQPYWKd5Z0jnJWSOjPFLm1nO2CwUL0Y+
         ZZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616394; x=1796221194;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WnR3vk2y0sTvUjvPy0qhotk3V03y3uemI3XFtyVMMug=;
        b=qT6kjBah0CkofLjTEoYUl1BYGegz26ji7+H1Otey3ThDCAxPca73C1aJTam1DEWw0E
         t4dGK6+W5KLpqRi47Eype3n1D5rs8qh48JBAb8XL7LfgnT8eJGp2PM6Isltt3Jdud0y9
         apSmmNaKP418c8WBiytY356JJANXzLGccM3p8Luj30UZDTG//GWBYbV6gq/fW22jae4M
         JLvJfEoLOKf1ZRCc+1tUD5OXEs4fJiVzTmjc9qH8apfYPXivJwlLoePHYvIKYfjLTZ4Q
         0wwLHQDwQb7QICAaw+UYWs76YKzx4npVqzv8WzUmmITL/5B1rlxx9vAAsQhScJQjC4Og
         9W+w==
X-Gm-Message-State: APuU4Z+EF6B1wPZ4zJwCQl3SCkJuKH3L68wQBY35GjlQgF55NhYKoNfc
	C5y/RQBZGcktQpZWBBkBskI3rhirHLeA1v6CV7kHrZpc8HXtaj15Hwt6h+5svC/hN8X4D/tEMUx
	a82ISDiYUkl8XYXjQMqVVocsbEQCuywvoxxvDrA8=
X-Gm-Gg: AZFdTZf0L3KQIGT1Fzn1GGIehnDaP4c34FateYXH7RiXAbfefA9wNFkA4uilxEdYAhm
	o4QRFqYj6I44RI9+B34FL4YhI5aDZkIZiG4laTfTQB73/Me7zQ5TXYreqNCrvsSW6pQnSpci+lE
	cLvAOwhPaugldTa9AjGH9yAOBxXrhz/MJ92MXRxFh9oedrhhcAgdN0W2XHdWGG3gsBq46dt6R31
	YtxiyozaafZBmq7T1la0ld1YvDTyW+iUPJQtkVs36Ve/dgwRlyoKtPqtT0jlkcvvWfW6YK5kKhT
	hB/QXMNWaBEKAJjk+B+OsvUdrljahfimTKRhA5F7mtChTbaL+PDmgN+3mww7YlyD7z1+BqvuajE
	t/ctW8UmrBgwhDi0wm3jq0kLHNsAknl44yQlM1XkeXtQAgXXApKJgVukkw1ww8IvdTLMt4qjCjE
	OxyYRMAdtW/CxtjCuPlFWMj5iAwilB2GDfG1T49YCwzXHUmVPETlW4uL3e/5DgcM9NSN19og==
X-Received: by 2002:a17:906:3e41:b0:c46:ae89:cd3c with SMTP id
 a640c23a62f3a-c513a3971a7mr1309913366b.1.1795616393801; Wed, 25 Nov 2026
 06:19:53 -0800 (PST)
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
 <09c26dab-505c-4126-b45d-a2128b0755c4@redhat.com> <CAPM+r-+-=3H1uN5=dim5O4cuFCWmx9agh88ERnMAN+fet7J2Pw@mail.gmail.com>
In-Reply-To: <CAPM+r-+-=3H1uN5=dim5O4cuFCWmx9agh88ERnMAN+fet7J2Pw@mail.gmail.com>
From: Johan ter Mors <johan.termors@gmail.com>
Date: Wed, 25 Nov 2026 15:19:42 +0100
X-Gm-Features: Aa3M54pMJt-OYhuEZWisz0ObNb-TQCxi4duhsv6CEP-uPo1pO5AVAmbMuZ2n3I0
Message-ID: <CAPM+r-Kr09yu0hzxpsoyAtr3RTYw40tYnezF20r9GZ43wREEsw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_TCP=3A_RFC_5961_challenge=2DACK_budgeting_and_unpace?=
	=?UTF-8?Q?d_RST_emission_on_closed_ports_=E2=80=94_lab_measurement_=2B_consist?=
	=?UTF-8?Q?ency_question_=286=2E12=2C_loopback=2Donly=29?=
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

As promised earlier in this thread, I rebuilt the lab guest on the current
stable release (7.3.6, tarball verified against kernel.org) and re-ran both
PoCs plus the per-socket cell at fixed probe rates. All loopback/netns
only, lab-only, and still no bug claim anywhere.

1. Closed-port RST levering (poc_tcp_rstlad_paced.c, plus the unpaced
   ladder inside poc_tcp_challenge_budget.c): delivery 100.0% at every
   step =E2=80=94 paced ladder 32.6 to 2086.7 pps (real pacing within 0.3 p=
ps of
   target at every step, challenge_delta=3D0 throughout) and unpaced ladder
   ~10k-20k pps in the guest. Identical to my earlier numbers on 6.12.117
   and 5.10.134: the RST path on closed ports remains unrate-limited on
   7.3.6 and does not share a band with challenge-ACK emission.

2. Per-socket challenge-ACK budget (the cell I promised curves for): two
   concurrent victim sockets per probe rate, 60 out-of-window ACK probes
   per socket, challenges counted per socket by sniffing the loopback
   responses. On 7.3.6 (challenge_ack_limit at the INT_MAX default, same
   as my 6.12 guest) both sockets independently receive an identical
   per-socket budget =E2=80=94 a time-based cap of ~2 challenge-ACKs per se=
cond
   per socket, independent of the probe rate, with no cross-socket
   suppression. Reproduced identically across three boots:

     probe rate   sock A   sock B   cap per socket
     10/s         12/60    12/60    ~2.0/s  (6.0 s window)
     20/s          6/60     6/60    ~2.0/s  (3.0 s window)
     50/s          3/60     3/60    ~2.5/s  (1.2 s window)

   For calibration against my earlier mail: on 5.10.134 (per-netns random
   bucket, default limit) the same cell showed 30/60 per socket; on 7.3.6
   the per-socket regime is directly visible as the ~2/s cap above.

No bug claim, no exploitability claim; kernel log clean across all runs,
no traffic outside my own namespaces. Artifacts available on request.

KR,
Johan ter Mors
>
> Op wo 25 nov 2026 om 11:30 schreef Paolo Abeni <pabeni@redhat.com>:
> >
> > On 11/24/26 23:49, Johan ter Mors wrote:
> > > Hi netdev,
> > >
> > > I am running a defensive-security evaluation of the TCP stack (author=
ized
> > > lab; all traffic between my own namespaces/loopback, kernels 6.12.117=
 and
> > > 5.10.134). While calibrating the RFC 5961 challenge-ACK mechanism aga=
inst
> > > a blind-SYN storm, I measured two related behaviors that I would like=
 to
> > > have confirmed as intended, and one consistency question. I do NOT cl=
aim
> > > this is a bug, a crash, or a memory-safety issue, and I claim no
> > > exploitability =E2=80=94 this is a measurement and a design-consisten=
cy question.
> > >
> > > # Observed (lab measurement, 6.12.117, loopback/netns only)
> >
> > Why using an old kernel? You should run the current last release.
>
> Point taken. My lab targets the 6.12 LTS line (currently at .119 upstream=
;
> my guest runs .117) and the host distro's 5.10 kernel. Both PoCs are sing=
le
> C files (no dependencies, ~1 minute per run, loopback-only), so I am
> rebuilding the guest on the current stable release (7.3.6) with the same
> lean config and will report the levering numbers for both PoCs back in th=
is
> thread.
>
> >
> > >
> > > 1. Challenge-ACK levering holds. Under sustained blind-SYN pressure
> > >     (synthetic storm against closed ports, aggregate ~500 pkt/s in th=
e
> > >     calibrated run; levering verified 100% up to the raw-socket EPERM
> > >     gate in the high-rate run), challenge-ACK responses keep arriving=
 =E2=80=94
> > >     I could not induce the challenge-ACK latency degradation itself o=
n
> > >     Linux.
> >
> > It's totally unclear to me how many ack/sec per socket are you observin=
g.
> > Since 6.0 challenge-ack limit is on a per socket basis.
>
> I should have separated the two paths =E2=80=94 thank you for asking. The=
 ~500
> pkt/s aggregate was the closed-port RST storm; no socket is involved in
> that path, so there is no ack/sec-per-socket figure for it. The
> per-socket challenge-ACK experiment in my evaluation ran on kernel
> 5.10.134: two concurrent victim sockets, 60 out-of-window probes each;
> each socket independently received 30 challenge-ACKs (A 60/30 and
> B 60/30), no cross-socket suppression. One precision: on 5.10 the active
> mechanism is the per-netns random bucket (the 2016-5696 fix), not
> per-socket granularity =E2=80=94 that arrived in 6.0. I will re-run the s=
ame cell
> on the current release, where the limit is per socket, and include
> per-socket ack/s curves at fixed probe rates.
>
> > > # Questions
> > >
> > >     a. Is the absence of a shared band between challenge-ACK emission=
 and
> > >        RST emission intended policy on Linux (i.e., Linux deliberatel=
y
> > >        couples neither to the ICMP/badport-style rate limit the way
> > >        FreeBSD's badport_bandlim() does)?
> >
> > Intended AFAICS.
>
> Thank you =E2=80=94 I have registered this in my evaluation notes as vend=
or
> confirmation.
>
> >
> > >     b. Paced-mirror experiment: when we pace the RST/challenge offer =
down
> > >        (7 tiers, 32.6-2086.7 pkt/s), levering is 100% at every tier =
=E2=80=94 the
> > >        same experiment on FreeBSD 14.4 shows a hard plateau (~126-138
> > >        responses/s). Is any pacing/bandlim intended for the unpaced R=
ST
> > >        path, or is "RST levering effectively unlimited by default" th=
e
> > >        documented/expected posture?
> >
> > RST on closed port are intentionally not rate-limited.
>
> Thank you as well =E2=80=94 noted as the expected posture. That makes the
> cross-stack asymmetry deliberate on both sides (FreeBSD's shared
> badport_bandlim() budget vs Linux's unlimited levering), useful context
> for the FreeBSD report I am preparing for their secteam (coordinated
> disclosure, separate thread).
>
> No bug claim anywhere in this thread; kernel log clean over all runs, no
> traffic outside my own namespaces. Artifacts available on request.
>
> Thanks and regards,
> Johan ter Mors =E2=80=94 independent researcher
>
> >
> > @Kuniyuki: please correct me as needed.
> >
> > /P
> >
