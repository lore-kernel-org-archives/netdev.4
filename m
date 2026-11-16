Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807185;
	b=kn5FLnGHY+1Ii5lINlJ2svKh/jHwIBlGcDaLCroGWjf25Mn5lplY25fynXYs/BdnPQx6
	 TK7NfQPPZteyRmqtOKEdIel7byxOnaFi9VwVoXwhaQljQdz/MBPQwNb+ub1qO/laxY4W5
	 8K7gNzBAXUZUh2z5dglN+un5TYbhUWLAZKYoElQ3hnmXDbwOuXy5HHzgLMR3XEMguX85q
	 0E0VhngPat4BKjk4LLFlNBD6K/T75DfxzORqVsCCRfpMgGVonR9dBE8w6aC+gE3hDu1TA
	 V7LTdKN4kRi3vTs2taCMNwb1I0ghaiz+f3fRfBaWGWtys0TLBzqycA2FZFn1iLE2YqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807185;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=Q+fAMtPRe8or+VoKQ4UDXYw4NbyaweMiaBkp1XuUmn4=;
	b=losQSxg8Ds0C7j+zBsx7bDGC0sDileS8ZmyxIRkDtG0V2PtB9vIyWstasxQMA80P55ZL
	 fInRSy8WDEivut4hzecKmdragC5EdXR8V0oyglQjZC+OCVi4jUaIfZGQLu9CfRajKOiIK
	 teaKzB2WqMF16gMDYYi8wr+xs8HNCXcSXPGpfkXoDS/fRUdUvafOcPl7v64bGM0htNriH
	 S2EbcQGunz3SysJsjpiGfEJIshLgVs0hte1tk06/FQ7entjhBaZuyMpsPr2WDrgXIACge
	 0m7ShjmpPI/82Y40SXpdHJKfJoWoZ4V7sVWypbjymvKAzScmsz/M4uJMt+HGhxLWaWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fIvZpsaI;
	arc=none smtp.remote-ip=209.85.210.228
Received: from mail-pf1-f228.google.com (mail-pf1-f228.google.com [209.85.210.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1007606A331
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 05:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1007606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fIvZpsaI
Received: by mail-pf1-f228.google.com with SMTP id d2e1a72fcca58-8b2382bf051so1620013b3a.3
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 21:33:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794807184; x=1795411984;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+fAMtPRe8or+VoKQ4UDXYw4NbyaweMiaBkp1XuUmn4=;
        b=Now6TbxOfzyCbZKkARguHg+wAppGlQuTEvaFOWdZuBuR/ntt8LPMBxNkiYal08MV35
         2CrYjafKjYmEelRmUgvEEzXrwzrJpwQ04LJPSWgeXkaN6vLrRek/fsTESaKWGgQkx1/D
         ChFEQDKmpEoDEdCx6x45vA3/FmNiEVc3BPCN0kZIkh9TMVeb1FJ89I9feed9u247pTMM
         GpvK/WsGHqexwolf9BVg7qKq89XyVu/Cy4xFdHvxRVEyIa2B0DIcMRrV4iJ/jONfVKl0
         Lw9Sf2yYGJBPYa0/UnbltrRJA4u3wrVF/UUP/rl48L0yxAhhA1bmV+aOij3XvsnTB+x5
         ZrQw==
X-Forwarded-Encrypted: i=1; AL+hErH3oT4UrnDXJ9J4bi4lhRNdQPgm2vPZ2tsFr4XOcI3WjBlwWfDwj1TN8NfncMR5zvZSdhP0B48=@vger.kernel.org
X-Gm-Message-State: APuU4Z/psf9U+A6kwyFPLnqrvft2ImVjJvyV/tyTEttsq8IikQykoIK3
	0YqFkGxSG6QYsShUIW3Iz2C8GMcNONaHKBQn+4PuNWkm694wnCP4YkQyHISQWakd+wVEb0zzE0Y
	oiYnEiAjET9EWsrwHQ3Ztt2GQpLZ0WvrX9Gw7uh9Z+HWwzq2b2CqLrEzXmqoxM1vusyRCDKi8q4
	JI9Kxhm+e8g73ETEZ6xcpHyRPzzdCLYFeaws/rS6TfEVtuBf0iXOOrIJ732SRUt+YJdwzBqhyAM
	DBQFh9aqP+/TKDhC4UW
X-Gm-Gg: AYBFou11BqSMNPje0tKmih7jd8eaUAoBAPFiPxamHn68LdfbpCXtawunYe0OWYzZI6L
	QgHHsspT+L+z+oqEk6AX+edlVoANc/EZqnm3iCymFeK96tl+3Hh24blM+AGc1yospWMmPRMeDYl
	4wh2tvT3Mpxt13+AaoWJaGTfARJeaOeR9Oh1Z/AeyIuO8T5UTNvwpxTrGEEtg76iVpb3MUhBXK/
	S/vWKiPs5aS6HMogzWo9ifSBGkqkODB/hrq1CbiD5t8HUoES5YjoYyFmleOZuHx+ABfOA7j2lNz
	H+mZEFxwqXw4K8uaqN+sV2+ApuuHZa01BDVK91VTYajeaTMGaRic6J0K99GivkLUm9lN8ckycLD
	qNpLne8A630oZ7jSUyxFyb8lyHj4IMUX9EQoSHUuD12cYIYjLv7YaWLVVARIlqeQkAaTdFKMHDI
	DzBAYAF7fk+PX7smkL8pam6iRihBHGNoLAvjjtRQqMu19f
X-Received: by 2002:a05:6372:a80f:b0:3fa:adeb:3986 with SMTP id adf61e73a8af0-3faadeb3a65mr2565732637.7.1794807183833;
        Sun, 15 Nov 2026 21:33:03 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cdded5aaa8esm43396a12.11.2026.11.15.21.33.03
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Nov 2026 21:33:03 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36ecd5db581so2913430eec.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 21:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794807182; x=1795411982; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q+fAMtPRe8or+VoKQ4UDXYw4NbyaweMiaBkp1XuUmn4=;
        b=fIvZpsaItqcsQyyS+jhYVjtUuXFdWwDm0jbsPAXRnSFC4zP8cZW4ekb7EEPNUorxn5
         PY/7UH75tUXMXVkJbrS+TAb9ordPjKArmfJ76UOCvAxHKbOatS4BgA3pxnl+5I7YXG3p
         FXLSiY0YHa8tvqmixS3nO+yr+txsTTzAn2B3E=
X-Forwarded-Encrypted: i=1; AL+hErHgm+opga8DFnOWgSpf47PPNi8WHbaU+qxGqcENl2IkAhTy5VRjbyfCnV0E98Ta81wk7ZJe5a0=@vger.kernel.org
X-Received: by 2002:a05:7300:d08d:b0:376:2ca2:d80e with SMTP id 5a478bee46e88-37966c47369mr8180363eec.30.1794807181051;
        Sun, 15 Nov 2026 21:33:01 -0800 (PST)
X-Received: by 2002:a05:7300:d08d:b0:376:2ca2:d80e with SMTP id
 5a478bee46e88-37966c47369mr8180336eec.30.1794807180252; Sun, 15 Nov 2026
 21:33:00 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111190011.53437-6-bhargava.marreddy@broadcom.com> <179477096781.3136.18075947087153422171@kernel.org>
In-Reply-To: <179477096781.3136.18075947087153422171@kernel.org>
From: Bhargava Chenna Marreddy <bhargava.marreddy@broadcom.com>
Date: Mon, 16 Nov 2026 11:02:45 +0530
X-Gm-Features: AclHuK_FdFBA3NgCxLw-dM3GQlzUp7zfotpINX3lWXGwzzz108p7nlKzDJHtrqg
Message-ID: <CANXQDtbK8MYPRQBuYGaG8bgCpLL_dAfL0CXt791weO-o46FyYg@mail.gmail.com>
Subject: Re: [PATCH net-next v4 5/5] bnge: create NQ0 during probe and keep it
 active across open/close
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com, 
	vsrama-krishna.nemani@broadcom.com, vikas.gupta@broadcom.com, 
	dharmender.garg@broadcom.com, rajashekar.hudumula@broadcom.com, 
	ramakrishna.koduri@broadcom.com, rahul-rg.gupta@broadcom.com
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000008b04ee06605e1c2b"

--0000000000008b04ee06605e1c2b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 12:59=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wr=
ote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 (1) =C2=B7 Medium: 0 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] bnge: race between bnge_napi_poll() and bnge_shutdown_nic() on
>   NQ0
>
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but the patch adds
>   more callers that hit it.
>
> --
>
> bnge: create NQ0 during probe and keep it active across open/close
>
> This commit creates NQ0 and its MSI-X vector once at probe and keeps them
> until remove, so firmware async events and HWRM completions are still
> received while the interface is down. While the interface is up NQ0 is
> serviced by NAPI, and while it is down it is serviced by a new nq0_work
> worker. The BNGE_STATE_NQ0_NAPI bit selects which one is used, and it is
> switched in open and stop.
>
> > diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers=
/net/ethernet/broadcom/bnge/bnge_netdev.c
> > index 400ada1023ed6..ab917c0f81b1f 100644
> > --- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
> > +++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
>
> [ ... ]
>
> > @@ -2963,11 +3057,32 @@ static int bnge_hwrm_if_change(struct bnge_dev =
*bd, bool up)
> >       return bnge_hwrm_req_send(bd, req);
> >  }
> >
> > +/* Hand NQ0 from nq0_work to NAPI. The caller keeps NQ0's IRQ disabled=
; it is
> > + * re-enabled here.
> > + */
> > +static void bnge_nq0_wq_to_napi(struct bnge_net *bn)
> > +{
> > +     struct bnge_nq_ring_info *nqr =3D &bn->nq0->nq_ring;
> > +     struct bnge_napi *bnapi =3D bn->nq0;
> > +     struct bnge_dev *bd =3D bn->bd;
> > +
> > +     bnapi->in_reset =3D false;
> > +     bnapi->tx_fault =3D 0;
> > +     napi_enable_locked(&bnapi->napi);
> > +     set_bit(BNGE_STATE_NQ0_NAPI, &bn->state);
> > +     BNGE_DB_NQ_ARM(bd, &nqr->nq_db, nqr->nq_raw_cons);
> > +     enable_irq(bd->irq_tbl[nqr->ring_struct.map_idx].vector);
> > +}
>
> [ ... ]
>
> > @@ -3017,6 +3141,7 @@ static int bnge_open_core(struct bnge_net *bn)
> >       set_bit(BNGE_STATE_STATS_ENABLE, &bn->state);
> >
> >       bnge_enable_int(bn);
> > +     bnge_nq0_wq_to_napi(bn);
>
> [Severity: High]
> This isn't a bug introduced by this patch, but the patch adds more caller=
s
> that run into it. On 32-bit builds, bnge_writeq() takes bd->db_lock with =
a
> plain spin_lock() and leaves BH enabled:
>
> drivers/net/ethernet/broadcom/bnge/bnge.h:bnge_writeq() {
> #if BITS_PER_LONG =3D=3D 32
>         spin_lock(&bd->db_lock);
>         lo_hi_writeq(val, addr);
>         spin_unlock(&bd->db_lock);
>     ...
> }
>
> bnge_writeq_relaxed() in bnge_txrx.h does the same thing. Softirq code
> takes the same lock too: bnge_napi_poll() takes it through BNGE_DB_NQ(),
> BNGE_DB_NQ_ARM() and the CQ doorbells, and the xmit path takes it as well=
.
>
> Here bnge_nq0_wq_to_napi() writes BNGE_DB_NQ_ARM() from process context.
> By that point bnge_enable_int() has already armed NQ1..n with their NAPIs
> enabled. The close path has the same ordering:
>
> bnge_close_core()
>   bnge_nq0_napi_to_wq()
>     bnge_nq0_poll()
>       BNGE_DB_NQ_ARM()
>         bnge_writeq()
>   bnge_disable_napi()    <- NAPI for NQ1..n is only disabled here
>
> Can this self-deadlock on a 32-bit kernel? Suppose an interrupt for one o=
f
> the other NQs lands on the same CPU while process context holds db_lock.
> irq_exit() can then run NET_RX softirq:
>
> process context               same CPU, softirq from irq_exit()
> bnge_nq0_wq_to_napi()
>   bnge_writeq()
>     spin_lock(&bd->db_lock)
>                               bnge_napi_poll()
>                                 BNGE_DB_NQ_ARM()
>                                   bnge_writeq()
>                                     spin_lock(&bd->db_lock)  <- spins
>
> With lockdep enabled, this should also be reported as an inconsistent
> {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} lock state once traffic flows after the
> first open.
>
> The existing process-context callers bnge_enable_int() and
> bnge_disable_int() already followed this pattern before this patch.
>
> Would it make sense to use spin_lock_bh() or spin_lock_irqsave() in
> bnge_writeq() and bnge_writeq_relaxed()? Disabling BH around the
> process-context doorbell writes would also work.

Yes. bnge_writeq() and bnge_writeq_relaxed() take db_lock with plain
spin_lock() while the same lock is taken from softirq. This is pre-existing=
:
bnge_enable_int() and bnge_disable_int() already did this, and this series =
only
adds another process-context caller. I'll send a separate fix to net that
switches the writeq helpers to spin_lock_bh().

>
> [ ... ]
>
> > @@ -3243,6 +3402,8 @@ static void bnge_close_core(struct bnge_net *bn)
> >
> >       timer_delete_sync(&bn->timer);
> >       bnge_shutdown_nic(bn);
> > +
> > +     bnge_nq0_napi_to_wq(bn);
> >       bnge_disable_napi(bn);
> >
> >       /* Save ring stats before shutdown */
>
> [Severity: High]
> Does this ordering leave a window where NQ0's NAPI is still running
> against rings that firmware is tearing down?
>
> bnge_shutdown_nic() calls bnge_hwrm_resource_free(bn, 1), which calls
> bnge_hwrm_ring_free(bn, 1). At that point NQ0 is still in NAPI mode:
> BNGE_STATE_NQ0_NAPI is set, vector0 is enabled and NAPI is enabled.
>
> On the close path, bnge_hwrm_tx_ring_free(), bnge_hwrm_rx_ring_free()
> and bnge_hwrm_rx_agg_ring_free() point cmpl_ring at the L2 completion
> ring. __hwrm_send_ctx() therefore waits until bnge_napi_poll() reaches
> bnge_hwrm_update_token() through __bnge_poll_work() and
> bnge_hwrm_handler().
>
> The waiter can wake up as soon as the token becomes
> BNGE_HWRM_COMPLETE. bnge_napi_poll() may still be inside its loop and
> may not yet have updated nqr->nq_raw_cons or written the NQ doorbell.
> bnge_hwrm_ring_free() then goes straight to bnge_disable_int_sync() and
> bnge_hwrm_cp_ring_free():
>
> CPU0 (ndo_stop)                  CPU1 (NET_RX softirq)
> bnge_hwrm_ring_free()            bnge_napi_poll() on NQ0
>   rx/agg ring free                 __bnge_poll_work()
>     waits for token                  bnge_hwrm_update_token()
>   <- wakes up                      ...
>   bnge_disable_int_sync()
>     bnge_disable_int()
>       reads nqr->nq_raw_cons
>                                    nqr->nq_raw_cons =3D raw_cons
>                                    BNGE_DB_NQ_ARM()
>       bnge_db_nq() with old cons
>     synchronize_irq()
>   bnge_hwrm_cp_ring_free()
>
> synchronize_irq() waits only for the hardirq handler, not for the
> softirq poll. Nothing here orders the two doorbell writers, so one of
> two things can happen:
>
> - The mask write goes out with a stale consumer index after the poll
>   has advanced it.
> - The poll re-arms NQ0 after it was masked. This happens while NQ0's
>   completion rings and stat contexts are being freed in firmware, and
>   while vector0 is still routed to NAPI.
>
> Before this patch, NQ0 was freed in firmware on close and re-created
> on open, so any state this race left on the NQ was discarded. Now NQ0
> persists. The same NQ also carries the async events and HWRM
> completions that the worker mode depends on while the interface is
> down.
>
> Is the bnge_nq0_poll() re-arm in bnge_nq0_napi_to_wq() meant to repair
> NQ0's doorbell state after this race? If not, would it be better to
> quiesce NQ0's NAPI, and the other NQs' NAPIs, after the TX/RX/AGG ring
> frees but before bnge_disable_int_sync() and the completion ring frees?
> That would replace doing it only after bnge_shutdown_nic() has
> returned.

Yes. bnge_disable_int() already runs while bnge_napi_poll() can still be
active, so this is pre-existing, but it is worse with a persistent NQ0. A s=
tale
doorbell write or a late re-arm used to be discarded when NQ0 was freed on
close. Now it survives. I'll fix it in v5 by stopping NAPI (with
synchronize_net()) after the Tx/Rx/Agg ring frees and before masking the NQ=
s
in bnge_hwrm_ring_free().

Thanks,
Bhargava Marreddy

pw-bot: cr

>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261111190011.53437-1-bhargava.marreddy%40broadcom.com

--0000000000008b04ee06605e1c2b
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGqjCCBJKg
AwIBAgIMFJTEEB7G+bRSFHogMA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI1MDYyMDEzNTI1NVoXDTI3MDYyMTEzNTI1NVowge0xCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzERMA8GA1UEBBMITWFycmVkZHkxGDAWBgNVBCoTD0JoYXJnYXZhIENoZW5uYTEWMBQGA1UE
ChMNQlJPQURDT00gSU5DLjEnMCUGA1UEAwweYmhhcmdhdmEubWFycmVkZHlAYnJvYWRjb20uY29t
MS0wKwYJKoZIhvcNAQkBFh5iaGFyZ2F2YS5tYXJyZWRkeUBicm9hZGNvbS5jb20wggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQCq1sbXItt9Z31lzjb1WqEEegmLi72l7kDsxOJCWBCSkART
C/LTHOEoELrltkLJnRJiEujzwxS1/cV0LQse38GKog0UmiG5Jsq4YbNxmC7s3BhuuZYSoyCQ7Jg+
BzqQDU+k9ESjiD/R/11eODWJOxHipYabn/b+qYM+7CTSlVAy7vlJ+z1E/LnygVYHkWFN+IJSuY26
OWgSyvM8/+TPOrECYbo+kLcjqZfLS9/8EDThXQgg9oCeQOD8pwExycHc9w6ohJLoK7mVWrDol6cl
vW0XPONZARkdcZ69nJIHt/aMhihlyTUEqD0R8yRHfBp9nQwoSs8z+8xZ+cczX/XvtCVJAgMBAAGj
ggHiMIIB3jAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADCBkwYIKwYBBQUHAQEEgYYwgYMw
RgYIKwYBBQUHMAKGOmh0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjZz
bWltZWNhMjAyMy5jcnQwOQYIKwYBBQUHMAGGLWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dz
Z2NjcjZzbWltZWNhMjAyMzBlBgNVHSAEXjBcMAkGB2eBDAEFAwMwCwYJKwYBBAGgMgEoMEIGCisG
AQQBoDIKAwIwNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3Np
dG9yeS8wQQYDVR0fBDowODA2oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2
c21pbWVjYTIwMjMuY3JsMCkGA1UdEQQiMCCBHmJoYXJnYXZhLm1hcnJlZGR5QGJyb2FkY29tLmNv
bTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAd
BgNVHQ4EFgQUkiPQZ5IKnCUHj3xJyO85n4OdVl4wDQYJKoZIhvcNAQELBQADggIBALtu8uco00Hh
dGp+c7lMOYHnFquYd6CXMYL1sBTi51PmiOKDO2xgfVvR7XI/kkqK5Iut0PYzv7kvUJUpG7zmL+XW
ABC2V9jvp5rUPlGSfP9Ugwx7yoGYEO+x42LeSKypUNV0UbBO8p32C1C/OkqikHlrQGuy8oUMNvOl
rrSoYMXdlZEravXgTAGO1PLgwVHEpXKy+D523j8B7GfDKHG7M7FjuqqyuxiDvFSoo3iEjYVzKZO9
NkcawmbO73W8o/5QE6GiIIvXyc+YUfVSNmX5/XpZFqbJ/uFhmiMmBhsT7xJA+L0NHTR7m09xCfZd
+XauyU42jyqUrgRWA36o20SMf1IURZYWgH4V7gWF2f95BiJs0uV1ddjo5ND4pejlKGkCGBfXSAWP
Ye5wAfgaC3LLKUnpYc3o6q5rUrhp9JlPey7HcnY9yJzQsw++DgKprh9TM/9jwlek8Kw1SIIiaFry
iriecfkPEiR9HVip63lbWsOrBFyroVEsNmmWQYKaDM4DLIDItDZNDw0FgM1b6R/E2M0ME1Dibn8P
alTJmpepLqlS2uwywOFZMLeiiVfTYSHwV/Gikq70KjVLNF59BWZMtRvyD5EoPHQavcOQTr7I/5Gc
GboBOYvJvkYzugiHmztSchEvGtPA10eDOxR1voXJlPH95MB73ZQwqQNpRPq04ElwMYICVzCCAlMC
AQEwYjBSMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMf
R2xvYmFsU2lnbiBHQ0MgUjYgU01JTUUgQ0EgMjAyMwIMFJTEEB7G+bRSFHogMA0GCWCGSAFlAwQC
AQUAoIHHMC8GCSqGSIb3DQEJBDEiBCDeF1eB8MNiN6mE7fn5zCGpCT8FUv4B1Z9XjRwg7NJbojAY
BgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjExMTYwNTMzMDJaMFwG
CSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYI
KoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAFVKVY
NF1WVF7yF0JzUwfwE+7Edg57Lqldwaft/T5cKRLag+T2YPV7C/B9Pmi+iJPmhttf+D/dgidPPRRK
FWWDXRArHqP07SvTbYLvrH3CLc6V3u6rcMHm5ncwBEfq2VgqA21y5x0z4DiMKZ71KeKk9wl//Nk5
ZJ+cm2G+KfA8D8Arbxi9ajyJp10Ph0I0lh3UMkbWl4vacKw7DDzPu8KLhAYPt1ZXrWisFGQSDjP9
zDWsWbNi/xdpvNCL6W9PCQOh9HRmizhQNm0/4kRPwu/rjfTIY7RtYWDeXQY+SmCOphSIfm5PuVgI
bTlNlQe5vnPEsIzro0lr2FMeyT8eNELo
--0000000000008b04ee06605e1c2b--
