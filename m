Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942173;
	b=zC/t5STvFc+fDBdz99WCPEfJSZiplJQ8vpSNiwVw55O6EWqGkjvbEyoDBWCjX5RUWHUT
	 PBDWitMFn+CrDoJXT/yfctAg3TGXWIGD6Xk5IfzU45Fi//6IcY4wdsWntBUxT8xEpO1bl
	 l9p/v5XNtQZyzQMp4LGxk8LagcQqX7pgWLRfSjORlvb5FesEb9SF9rb8CRqJKXOXMQi2Z
	 Ekj+y4cvSNglx++VRaVpltzE2MY/Ujrq29/r1wSM1hOyAivZRyTtFkt52lVH+ct+zaY5v
	 tgdKWfm4GryMBUuYrZSLLiC9+5EaVAaWh5D7/uv45gAQeUYD6MfxTKdqS7vABLxppGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942173;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=EhI5TLOlL+9vNzhu+UAy+2REBUSKFNqlNp3HDll8Qkg=;
	b=ZKZyVKoasUz1ZS0D56sycQzssZGXl1HkkagGVgT3bpC6xT/PVIeATlo2lw2nsYFdT0If
	 dM27PvWcbpa/jmvvn+AphOS8bRfpxn3LHAH2mSdy5aTVS+UsC21XDU9nhPMQ+4Jw3jJn3
	 PIUy7DdkoMZwUIBfJa5cwd5DMn+cMBob2nXpnQhgvwqtywUeENP6nIEv+XBQLjDiZQJfu
	 avTbyi1GJa3KQVfMZNr3IaVusTDtDfj4GbBMMqUikIzYnCPn/suNAhZJjCDITYoL2WVrk
	 v7ZJsQ5b5kZOE1Kpa2WbuUbiJ+oy3+DrzHRKcWCJ/lFMve8kozuYtVlVSeic/Yupj1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NsowI7XI;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=djsaEppF;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114F1606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 19:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 114F1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NsowI7XI;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=djsaEppF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794942172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EhI5TLOlL+9vNzhu+UAy+2REBUSKFNqlNp3HDll8Qkg=;
	b=NsowI7XI6ymOWDlsWIhcnM7dAlecGxLi/s9P1vVi4/Pf3kHsxoIecAhTCVscUMc5o/c4Jk
	7ZvFm/UVqzPuwHQsUDZg6NSzqTwQoOGsE87Z8mnMk8izjGUPrQ7qnX47dPr0P/2olAFp5q
	XepyrxZ44C8vFPIZcSZ7gkIGh5/6884=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-tnFLOq_QNmSggjegiMcicQ-1; Tue, 17 Nov 2026 14:02:50 -0500
X-MC-Unique: tnFLOq_QNmSggjegiMcicQ-1
X-Mimecast-MFC-AGG-ID: tnFLOq_QNmSggjegiMcicQ_1794942170
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-492b5408dedso55548f8f.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 11:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794942169; x=1795546969; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EhI5TLOlL+9vNzhu+UAy+2REBUSKFNqlNp3HDll8Qkg=;
        b=djsaEppFheB/OSdCyYwXFM96wxsVd5uWgRNozzLPp8iRTQU86Iv5hY6ZWGPprCfSX1
         JCZbc5GY6XGnLwNc74XhTHwlJRLTGsrkCJpA7YMMmIDJWsk4NUeA8hAy6YlpuNgB0ZsB
         vWba4yokU0i0cuCa/tdHNqmmNzitoMnD/Kh3Ro9NCo5isu79kkb2ap4d7YgQXLMCIXCP
         CN0MloMBQROoYjnP6kSQWT8amReza7DWPObHqqZWGIkZVPX/BgpDU4g/Fp2GyEIu8sHM
         +7AMtDPj6DhqGlQ1bQ1eLgc8ubvegI4htiGlMtSjYKMlaswawPr00WRu9/oRUcYLWVfL
         hvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942169; x=1795546969;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EhI5TLOlL+9vNzhu+UAy+2REBUSKFNqlNp3HDll8Qkg=;
        b=hqgWI63710yKYHDWrYC8GNMWuMxWe6DwMp2TrYsOpcc2DfAaIuChWQSBAxk6E1iiEE
         rENncouOb8yu5dWX7L7Dzhq4JZNYWU8fLjnY+VfUjwM9u5JjW0/989TRwTd+9/LXN3lh
         j/JPAtt1GDHlTbScDg2BPSNU4N02buxY4USo8WEY0eEDJUmD7o+fax38MWl27QU/iShk
         NxDj/yw/iMwsnjwAHDbgUR9Gh2MAPSz7IgnCKzivsNLPRNkDoTuzg5rd68RFh/hZr+BJ
         6ZY9i/uq061e9RC75EcHbIJa3FfHYvpBciAxN2AWH4DR6Yqs4lWAYiOgr38G39lALCCm
         S29w==
X-Forwarded-Encrypted: i=1; AL+hErHStMPPN7zQJ+U8YkdK4i/JUnId0MykkQcruw8vBqNLFVbcyn+QutMhZoDDUQ8hfNde/TWT5S4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aDiwIWrHhgvRKYjeicCEx4k+adAzLnYlbY2x9tC/63x8wWvhT
	mDa5bdAmmjndoDVJYGzEsfUixqIGQEPbyW74x1P4Xt5Jz0wlRRztlv2CRiesFxLz9E5G4uv7Dg5
	jsCYCY+7pfeHDhHjSsfN3uR8Wxr29tyU4hD5S9ybbtIvEjCN/9FxkmUWyiw==
X-Gm-Gg: AZFdTZev9esxQfA6LRdPhhEcI+UR0zfnMhFjoyksGLYfgw0ZoqC0e0ozqCNCR7OixHm
	we/L4HpkezwbLQ+eMRwyaL/RuG2iJIgMg+QSZp/71XXupLXQOeijaoybPaO/OSsQTqpU2ummUjN
	aGEE3Oprki9RA7TfzA0JRtgofw3q+LTVMetDVcSS8qTr4qZmKlhepP3pFKXN+ttgUMoqek7mujy
	BxBYKCSErxrrHt+xNYsedhZa/xxGB9SBcowYAEsSrWVjGpFxUnwrtMBdhi8Re8nZlonwrRNX+N1
	M18U8DS+50h9882G2qOmplto+mECb2GTPtZ1fzCh7pMpvwd7VHJNAiVYjEjq4J+WH3Hkx/hVeeH
	Uzza3cXO00qIv93ZIP8gTp19Jkbru1gZ+PnyoyIVzzr7ZMmEoUqMPy4SYKwRuTgUZb6Wyx6/DUP
	N5S7VFWxyObyw=
X-Received: by 2002:a05:6000:3108:b0:48f:bcf0:2026 with SMTP id ffacd0b85a97d-4a6389ed16amr883014f8f.13.1794942169593;
        Tue, 17 Nov 2026 11:02:49 -0800 (PST)
X-Received: by 2002:a05:6000:3108:b0:48f:bcf0:2026 with SMTP id ffacd0b85a97d-4a6389ed16amr882975f8f.13.1794942169208;
        Tue, 17 Nov 2026 11:02:49 -0800 (PST)
Received: from [192.168.0.19] (217.red-88-4-146.dynamicip.rima-tde.net. [88.4.146.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095e98sm276159f8f.42.2026.11.17.11.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:02:48 -0800 (PST)
From: Sergio Lopez <slp@redhat.com>
Date: Tue, 17 Nov 2026 20:01:52 +0100
Subject: [PATCH v2] vsock/vmci: reject datagram binds in local network
 namespaces
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-vsock-vmci-netns-isolation-v2-1-d6f35e86416a@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQrCMBBFr1Jm7UgnrS248h7SRUhGO2gTyYSgl
 N7d2BO4fA/++ysoJ2GFc7NC4iIqMVQwhwbcbMOdUXxlMK0ZiKjDotE9sCxOMHAOiqLxaXOd4cj
 9MHbGOz92UAOvxDd57/HrVHkWzTF99q9CP/tXthASOvataU8924Euif1s89HFBaZt277ToLM+x
 QAAAA==
X-Change-ID: 20261113-vsock-vmci-netns-isolation-7e46732dcd73
To: Bryan Tan <bryan-bt.tan@broadcom.com>, 
 Vishnu Dasa <vishnu.dasa@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, 
 Bobby Eshleman <bobbyeshleman@meta.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
 netdev@vger.kernel.org, stable@vger.kernel.org, 
 Sergio Lopez <slp@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2665; i=slp@redhat.com;
 h=from:subject:message-id; bh=TprLl35HMOZ700RHSD7wldVyF8nfQtfAOCm+aXiPq8I=;
 b=owEBbQKS/ZANAwAKAfRpJ40vDAI1AcsmYgBq/KTKg78yHHA1T+U5q33lvKFKhEHajCHacKczx
 gRFaBZa1/uJAjMEAAEKAB0WIQS+1fz3US2GgJFC6KL0aSeNLwwCNQUCavykygAKCRD0aSeNLwwC
 NZmaD/9qZAz5FLYTpTVOASrTHfMHxQjA4+DunomqrpVGDSV+BIUU2Ro4t/zHcZhv9m3tc0lx8s0
 FimzrAPcFwIDyWn12MetCnXqsav6Up6oXDk8BTuKWa0wGZbEBoBnlQ25ywTodqur3XXTnkYP+Ls
 VCCJCeNA0vfttrII+qqFdAHIXDfxPQefp2MFrsplHJQEIrWw6ZUKQ6m9oUDUFmr8PGKhJ0zlnA6
 b0F6nHW0nyX+mHPh8vVOfpDE1hQIwtxb5IKnpYVpzgBGFAufVfbvl31VzykbyGMJ9bECmhZZ9yN
 CAIBHlb3PzFNXUT8tHPcpL+jqUC8roU6si7hcqfEiOynAFoiSq0w5lu0HKWxbdwk+thKngd8jzY
 z3Y6eHNWdUSbdWABZalFGN1yuUe0gp4AyjGlxzvF2AqmhtpvFHGeCehA0WfJEgEDi+pfaNWoJCP
 mEwSJMxhOKxpfCXAjRK5d/PI0fD0B9TOLxR5JDKUs3CWhc39NTXYxZ5WRAQS2sw27SS8/VLVjF7
 t3MtOExaHVigSx0R20rRWKNucV7t9gZOFktQXvOYYpKRyOov8EFHkDA1lGlLtaBLn+k++acUzSR
 Fktu3CdnHDFv9AWIl8hgc1PTbBJhizS50YTN+u1bvIVXMcvV9t5Yufk0RGOKinb0zt6X8293phK
 vVURjCf2xVn2qNg==
X-Developer-Key: i=slp@redhat.com; a=openpgp;
 fpr=BED5FCF7512D86809142E8A2F469278D2F0C0235

VMCI already rejects datagram sends from local network namespaces, but a
datagram bind still creates a receive handle in VMCI's global port space.
A VMCI sender outside the namespace can therefore deliver to the local
socket. Its handle also prevents a global-namespace socket from binding
the same port.

Reject VMCI datagram binds in local namespaces. No namespace-local
datagram transport exists, so EOPNOTSUPP reflects the available receive
paths. Unbound datagram connect() and sendmsg() also return EOPNOTSUPP
because both call vsock_auto_bind(). The receive callback rejects any
local-mode socket as a defensive check.

In a KASAN/lockdep QEMU guest, a reproducer observed cross-namespace
delivery and the global port collision before the fix. After the fix,
local bind returns EOPNOTSUPP, the global bind succeeds, and a global
VMCI datagram still reaches the global socket.

Fixes: eafb64f40ca4 ("vsock: add netns to vsock core")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/sashiko-outbox-212907@kernel.org/
Acked-by: Bobby Eshleman <bobbyeshleman@meta.com>
Signed-off-by: Sergio Lopez <slp@redhat.com>
---
Changes in v2:
- Combine the VMCI receive checks and clarify the auto-bind effects on
  datagram connect() and sendmsg() (thanks to Stefano Garzarella).
- Carry Bobby Eshleman's Acked-by.
- Link to v1: https://lore.kernel.org/r/20261113-vsock-vmci-netns-isolation-v1-1-ced02054ea61@redhat.com
---
 net/vmw_vsock/vmci_transport.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/vmw_vsock/vmci_transport.c b/net/vmw_vsock/vmci_transport.c
index 1f186e8f8364..d53704e31af3 100644
--- a/net/vmw_vsock/vmci_transport.c
+++ b/net/vmw_vsock/vmci_transport.c
@@ -627,7 +627,8 @@ static int vmci_transport_recv_dgram_cb(void *data, struct vmci_datagram *dg)
 	 * outside of the create and destruct socket functions.
 	 */
 	vsk = vsock_sk(sk);
-	if (!vmci_transport_allow_dgram(vsk, dg->src.context))
+	if (!vsock_net_mode_global(vsk) ||
+	    !vmci_transport_allow_dgram(vsk, dg->src.context))
 		return VMCI_ERROR_NO_ACCESS;
 
 	size = VMCI_DG_SIZE(dg);
@@ -1697,6 +1698,10 @@ static int vmci_transport_dgram_bind(struct vsock_sock *vsk,
 	u32 flags;
 	int err;
 
+	/* VMCI handles are global and cannot serve local namespaces. */
+	if (!vsock_net_mode_global(vsk))
+		return -EOPNOTSUPP;
+
 	/* VMCI will select a resource ID for us if we provide
 	 * VMCI_INVALID_ID.
 	 */

---
base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
change-id: 20261113-vsock-vmci-netns-isolation-7e46732dcd73

Best regards,
-- 
Sergio Lopez <slp@redhat.com>

