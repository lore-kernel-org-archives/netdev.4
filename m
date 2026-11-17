Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794951131;
	b=VNzp+Rq8e68iT7NcZG10pTwPEMqZ7/gM2Dw+VxgpKxqYgwRZUYj+h/FS30xWhfAjV3Lq
	 yusCplDhMhcEOD/ZqoGwxI9jLbd9qjVeLHYTIcUVDN1SBCNC3/9Eo1lITL0c5yaVY/DlS
	 6JiQXP5hKB2QueK8bZ7dO6m/0iWc6jPgb9lcRTuSBFOTmixobNdlm04aOLj/KF2gZQxGz
	 6nuf8hfSdTLNuT/zKsg/sTikedKTmhKF9z3sIve3AtlI2CEu9NTn88igJQEze5fyxEgHT
	 0wjrU/cfwrZdJKQ22Q/Q1koLTpdk2uA5nFYGM1aYm40tHT+mQIrhyZH/UU4kxX0wEHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=pQigcKFaqscazfCahmXGcC3qjZsqv0wKtcZ2YgOYhLk=;
	b=BZ1GCH5Sbl2qr3RbIwmC3DpC9hud3CMpmOjpIn7b/S6D5vzV264HQfCzR51mAKYS+0OT
	 AhJsv3X0hb2vwpI8qo9NNTBu0GAe01wj3qBVEor1kTivWUBQYxldtJug8RZaM0E/f1CcD
	 xj0HHlHkmvGlxB4uBOa0wITpSsWQ7DD2l0jcjnw6ANIFuC7OsZcIwrbwcLVYM1tzz0xm6
	 zFN44S+oXMC+l2smezuYE3QvjP2E9Gj0uvY3qEI0CbJyGyX7LwvIi69/ZUQ5Rq66buNVY
	 LNd5GCQRIAQk0s2HFqrQ2f7Vk4e/eoVU3G5ZTcgeMoiioz+pjX6M0Cx3VUQVZFPnfgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=paoTNAct;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8468B606A32A
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8468B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=paoTNAct
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso2375675e9.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:32:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794951130; cv=none;
        d=google.com; s=arc-20260327;
        b=B4/AMIgr8GHI/1t4NtMZiueKPqwMTO/HuHXXvf0kpdtWrwYc+UiKzW0UwzRwFV46c0
         SNuWqHYVoiWDENfK2kevfjxSXKK+eF3DPMbM4m5vyNHbw5c6b6NGSlD7ghF0PHa0AyGd
         qTYaBA1cBKN9JpdWW1vFOjCwHNBiq52+5zsbvB/YyWcFPnh5QxEhDlnMxnRtmbHUe58j
         cAM15NAqXJS0y0vHNyUMyzM/UgN9zYmZy0bbVoJ7Hu0WhVMdQsWVI2thbXXFAMvQcy4E
         0UIWFuIavIX47VTUyd7jY7uwDPQwg2cvhd8nJHowq29aVYid4v69gAUXlPLPf70YlFp+
         QT+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pQigcKFaqscazfCahmXGcC3qjZsqv0wKtcZ2YgOYhLk=;
        fh=sgMlnpPIkoatpKB1xJDHQICPZqesERPploa6LoXqXLk=;
        b=MY/eY1muldU52JIaWQiJ6qrvlM0iM+f45O6FdJYmqhVQAOp5MaX/on0qaS4GuLzZ90
         osOkVSUWOA3Tx/6BtStt8ZbfsvwPkkwo9agyZR7RC5+zpLvKoKJd889KogR9IPS2bwrl
         nYUOXs1PaMmC6ORVKKqvttCxNn5+kSHANf+13glwilz6H0fa3I7lOinnGwvY1xQU4/MI
         iOLzfpRU8IvPnuBS5ku8RqZCXgaJ+QrjUeZg1DntA5Ebo0D/qIE1+iZWKzx3KcIMI/0d
         iRA5/R4LqI4rtxTDmKCvQpUCCEy7HtRcU8AsdX7V6KBnRbppMbl3ykz391HXDc8ryX7l
         H1Ag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794951130; x=1795555930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pQigcKFaqscazfCahmXGcC3qjZsqv0wKtcZ2YgOYhLk=;
        b=paoTNActUHXa6OYYOiIWdU1DI1wqV/cU3kbvXnAw3jJKKI8y9UD8U1bPa/18ly8vW4
         d8cD6C9zm+pjrjKEsJxXipED9zzcJa5JNOeD/WeseiyNYVEOZ+nyh4lKFZExKzAKX4Ph
         oxItCVD6Fgyh9gezo7+zv0uxKnmRBD1JVk24biFENrN/oGX0XhGTgmdmHVXSvxPM+q7O
         E68s975as/nfSC2aNME+SJIj2qyXzo4qo1knJ9JAhB+8uqI6fqfLIVhqInp6YUB1N7l0
         4ctGRraYJLj3g45LkHiLpY72IM49SKBrq5zlFecQbX/N02cMdCqFupjzX3Dj2CKxWMhu
         BiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951130; x=1795555930;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQigcKFaqscazfCahmXGcC3qjZsqv0wKtcZ2YgOYhLk=;
        b=0Fm6Ez9ygNPVk8rRV/cG91UI5ItWnxbdrZWsGZluO19b4zVIq7xLQOWq+7jDj2vmsU
         jym5KuxEM8f/SBi6rm5VdTYaLJER2CXuLfzj0N/3tQyDKFqpkEm3ZwiR8aPHnTykvQIN
         nItPjazsN7Kw1xWsru4ZpX0Lk+P4pbzWc68pBZmb4mdOlDKiSLa3YZM5NbXImGvhU0Hx
         gMDSa9S9sbUW96aJ509P2G0ATFuUelh8q+scHjc0xrnvwbQ279UKqZ4eeyYnq8g5SIji
         ZjOrBLG8dEEZi6rWZhFFJt3Z16Ywet8JN8OpiL4U3AX+Oj2p9OLvBYTzTxnUribXJr3w
         eUPA==
X-Gm-Message-State: APuU4Z+7pV9Y+vo61Ugsq67H68XVo9SilON+Hytl0sNh7K//4muclLZB
	/cgIiN+2StEC5PgzcfgIgZ3roRmOcICIsbDivjn1z05b7/Fe3nqfISXEGYa8LapAdlBkuxXlLju
	KUWyvkLcSaXabw9H/y/jyLQQIQL8Dpmk=
X-Gm-Gg: AYBFou101/TZdd4YWo5VZzxcipDOYHHTsO1NwKcggyjTvB4b9sx6LGxiD8h9QmSNT2w
	YQ7JkycRbfNIGTnbPMhqzF8W6kctffYAfLcBXFVO2eLl9/VS7PpnwpNd0DRkGJ/ejJegUQJR8HT
	WCV9F3ABxZJ4o9hQd0oEVpq/esv1hRrp/wR8vdzxXAafTLswFuX185luBLd4Ytz3TMcK8s0X7RT
	+xk236V6w+MkikHWrb4oLJGltATBCUqhjkwatAgiE/lXpgSrFSVcLOImHUDMcvUAZ6caLV+t2+K
	n4zFEVZkMcBGV76KsyTdhfdVYRNf5RjWXcbcyq8Wqx9AwVsbHti/iwpCRiD3Dgj61ICNF2MmN8o
	8fuP1xhdMP0DCmtrVHnHoUvKy86dtz3hun4EBOYAEGDbx0rZjBMY8tWE47obhyw9ErPTZ/HCTPV
	wVhi7ZZ7XVL5JQwUTmss/9lmjVsauuXgdp1ztOHhYgEmu5GPGWvGwYbw==
X-Received: by 2002:a05:600c:6088:b0:4a2:967:dfb8 with SMTP id
 5b1f17b1804b1-4bb7da26748mr8014735e9.20.1794951129685; Tue, 17 Nov 2026
 13:32:09 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179460248693.8819.282933709034208845.stgit@ahduyck-xeon-server.home.arpa>
 <179495005876.3136.9616798412841778832@kernel.org>
In-Reply-To: <179495005876.3136.9616798412841778832@kernel.org>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Tue, 17 Nov 2026 13:31:33 -0800
X-Gm-Features: Aa3M54ozUWF78OJuibOHFAk44LTTcGadx122U2Sc-rQPXn8_42m05BpRiWOyx3o
Message-ID: <CAKgT0UcDxJHs2jCUtMDPzTBX2pFahFOSO=Qd01mO-4xCwZ1Ozg@mail.gmail.com>
Subject: Re: [net PATCH 1/6] fbnic: Wait for in-flight PTP timestamps before
 treating Tx as idle
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, horms@kernel.org, kernel-team@meta.com, kuba@kernel.org, 
	pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 1:14=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The new comment above FBNIC_IDLE_POLL_US, and the commit
>   message, say a 20us delay keeps the PCIe reads 'a small part of each=E2=
=80=A6
>
> --
>
> fbnic: Wait for in-flight PTP timestamps before treating Tx as idle
>
> This patch moves the Tx idle wait into its own function,
> fbnic_wait_tx_idle(). The Tx path now counts as idle only when the
> QM idle registers report idle and FBNIC_TCE_PTP_INFLIGHT reads zero.
> The patch also raises the poll delay from 2us to 20us and extends
> FBNIC_CSR_END_TCE so the ethtool register dump covers the new register.
>
> > diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net=
/ethernet/meta/fbnic/fbnic_txrx.c
> > index 07d4b2e923627..c75c5683b724e 100644
> > --- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> > +++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> > @@ -2398,38 +2398,85 @@ static void fbnic_idle_dump(struct fbnic_dev *f=
bd,
> >                                  fbnic_rd32(fbd, regs[i].reg_base + j))=
;
> >  }
> >
> > -int fbnic_wait_all_queues_idle(struct fbnic_dev *fbd, bool may_fail)
> > +/* The poll timeout only accounts for the delay between polls, not for
> > + * the time spent in the poll itself, and each poll is a series of
> > + * non-posted PCIe register reads that take on the order of a
> > + * microsecond each. Space the polls out so that the reads stay a smal=
l
> > + * part of each interval and the timeout stays close to wall time.
> > + */
> > +#define FBNIC_IDLE_POLL_US   20
> > +#define FBNIC_IDLE_TIMEOUT_US        500000
> > +
> > +static bool fbnic_tx_idle(struct fbnic_dev *fbd,
> > +                       const struct fbnic_idle_regs *regs,
> > +                       unsigned int nregs)
> > +{
> > +     u32 inflight;
> > +
> > +     if (!fbnic_all_idle(fbd, regs, nregs))
> > +             return false;
> > +
> > +     /* The QM idle bits do not cover the TMI completion path, so a
> > +      * timestamp request can still be waiting on its completion. The
> > +      * count is bounded by the timestamp requests the Tx path can hol=
d,
> > +      * so all ones is a failed read, as for the idle bits, not a coun=
t.
> > +      */
> > +     inflight =3D fbnic_rd32(fbd, FBNIC_TCE_PTP_INFLIGHT);
>
> [Severity: Medium]
> Does a 20us delay really keep the reads "a small part of each interval"
> in the case this patch adds, where the QM registers are idle but
> FBNIC_TCE_PTP_INFLIGHT is still non-zero?
>
> In that state, every poll in fbnic_tx_idle() reads all 28 Tx QM idle
> registers (8 TWQ + 8 TQS + 8 TDE + 4 TCQ) as all ones before it reads
> FBNIC_TCE_PTP_INFLIGHT.
>
> For each all-ones read, fbnic_rd32() does a second non-posted read:
>
> drivers/net/ethernet/meta/fbnic/fbnic_pci.c:fbnic_rd32() {
>     ...
>         if (reg !=3D FBNIC_MASTER_SPARE_0 && ~readl(csr + FBNIC_MASTER_SP=
ARE_0))
>                 return value;
>     ...
> }
>
> That makes about 57 reads per poll. At the comment's own figure of
> about 1us per read, that is roughly 57us of reads against the 20us
> delay, so the reads are about three quarters of each interval.
>
> poll_timeout_us_atomic() only charges the delay against the timeout:
>
>         if (__delay_us) {
>                 udelay(__delay_us);
>                 if (__timeout_us)
>                         __left_ns -=3D __delay_ns;
>         }
>
> So the 500000us timeout allows about 25000 polls of about 77us each.
> That is roughly 1.9s per Tx wait rather than 500ms.
>
> fbnic_wait_tx_idle() can run two of these waits, one before and one
> after fbnic_tx_flush(), so about 3.9s. The Rx wait reads 12 registers,
> 24 reads per poll, so it adds about another 1.1s.
>
> All of this is udelay() busy-waiting while the RTNL/netdev lock is held
> in fbnic_down(), fbnic_set_ringparam() and fbnic_set_channels().
>
> Could the delay be sized for the real per-poll read count? Another
> option is to bound the wait by elapsed time, for example by reading
> FBNIC_TCE_PTP_INFLIGHT first or using a ktime-based deadline. If the
> code stays as it is, could the comment and the part of the commit
> message saying "the 500ms timeout stays close to wall time" be updated?
>
> > +
> > +     return !inflight || !~inflight;
> > +}
>
> [ ... ]

This is assuming the worst case, but in the worst case we are talking
about the Terminus Tx or Rx path essentially being locked up to
trigger us being stuck in the wait that long.

The likelihood of this is incredibly low, and the change that was
already made reduced the worst case to under 10 seconds which I feel
is reasonable in the case of shutting down an interface that is
potentially in a stuck setup and requiring additional time to flush.
