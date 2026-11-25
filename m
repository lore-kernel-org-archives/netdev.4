Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618398;
	b=HS0c5C6rNDSJ2ZTdCl7XAD0F2/t48z5hPEg04OFFukFzEfcOZLBEGfbt41sldC218WH3
	 GC1J8yzZ8RLHupa8Nf6f9mHsr8+f4y42sXWTgKfodlhnI0EUUUgrQ9fyXf7ajDngTHx5t
	 Pd+lp8K0SBi05H8MM9JCD5lYKBKUKk16DmepoQrHHkqVkMWRrJRTrnwvJX3uG3nnHol5j
	 ouEJwrNN4ArqT9GhRxGGGGsM5pQALHbLThIip2bt4EMMNCXFEjkRGDPAm5mRghx+xyCJg
	 SJELjlVLX1yTt9Vfesab8JwyPhl/c7nybrStM/3bzj0w/Jga3KCiE6galgLdzWd4sLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618398;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Level:X-Spamd-Result:
	 X-Spam-Score;
	bh=/xsHMxJsVOF1FPSvJ64uESmQqfTIWpb4LJh/yq+k8ac=;
	b=RpRbY5osnibVl2p772Qi/kfcIeia3dXF8B1dkGxo7pteoSjlaUv1zEj1VUb03ypNwEfv
	 Jsfz+kf6g+DZU9m8XqdUd9BTWTmZCozcmV4Y+m15JdKRChbd2pl+b2dWeFnIiKwvfMYO6
	 o1fx8lnBakRnhNcqt/TJlOEIhf6aPVGLQDd7RWN4KOy+1eJElaj+nS3MwweWKyXFc/WJ4
	 Vp1rneqpbwjAPD7hW1jxYePv9xjqz4viyJHqfLgmVEuc5sLI9Cj+eehOQi1ChsGa85szU
	 MK6ttT5TeyyTH2ixhlfZXyNP0RSsAzHP5kGS25rQnBkD+x3djqrBcGkqPQnih4COZ5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=O+2Y+hkd;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=O+2Y+hkd;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84714606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84714606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=O+2Y+hkd;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=O+2Y+hkd
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C5AB721F97;
	Wed, 25 Nov 2026 14:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1795618395; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/xsHMxJsVOF1FPSvJ64uESmQqfTIWpb4LJh/yq+k8ac=;
	b=O+2Y+hkdlaE9+YSch4uu4ulg+XzpJ8ia0vmTeF16lby/LGtOWGjozSIPs2EkgDT6uidUbe
	Efx4Kq3sUG07ZsjgdRqtmBAdbDzS8tZdj6MJzxF1ucRugASbheJY8HKzQ3D2p7JGqifQp5
	ny02pKIjN+ivCLE1y534E0BLeoLglR8=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1795618395; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/xsHMxJsVOF1FPSvJ64uESmQqfTIWpb4LJh/yq+k8ac=;
	b=O+2Y+hkdlaE9+YSch4uu4ulg+XzpJ8ia0vmTeF16lby/LGtOWGjozSIPs2EkgDT6uidUbe
	Efx4Kq3sUG07ZsjgdRqtmBAdbDzS8tZdj6MJzxF1ucRugASbheJY8HKzQ3D2p7JGqifQp5
	ny02pKIjN+ivCLE1y534E0BLeoLglR8=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 84BCA134CA;
	Wed, 25 Nov 2026 14:53:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2heAFVv2BmupfgAAD6G6ig
	(envelope-from <oneukum@suse.com>); Wed, 25 Nov 2026 14:53:15 +0000
From: Oliver Neukum <oneukum@suse.com>
To: petkan@nucleusys.com,
	netdev@vger.kernel.org
Subject: [RFT 0/2] net: usb: rtl8150: cleaning up races with ceasing IO
Date: Wed, 25 Nov 2026 15:43:06 +0100
Message-ID: <20261125145313.58434-1-oneukum@suse.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -11.80

The driver has the fundamental issue that it uses a tasklet that
reschedules itself and resubmits an URB, which in case of an error
can schedule the tasklet and so on.
This cycle cannot be broken by adding primitives for cancelling
tasklets and URBs but it also takes a flag preventing rescheduling
or resubmission of tasklet and URB.

It turns out that this is quite complex because the issue hits in
close(), suspend() and disconnect(). The required changes became
so complex that I decided that this needs to be broken up in series
of patches and needs testing.

V3: Added patches for close() and suspend() which Sashiko noted
to be absent
V2: V2: Sashiko pointed out errors which conceptually arose from handling
close() and disconnect() in the same way. Treating disconnect()
separatly makes them go away

