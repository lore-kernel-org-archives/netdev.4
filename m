Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536803;
	b=ChqOdGf/l0MsP0vtYoQjyTU9uLeJN07+0gpzFIT7dFGn4wp8RDJFSMX2WUumeP2dyCQw
	 DCk7dIrniyOD8ae0Qq33lYOxTZUCbIpzkN6xCcr43+A6IYqCcARlG9yk8cW+SQiVM72v1
	 5uH+JAb2FzqEA0V612fOV+I+SUFNbfMAR7ku0yGuMz6mPogfQ8k4CoMhN4lR3njMK1c70
	 kUdi1X2q2IhJCRyzlhl177gvRJ8QeeyWjIYzMYRefAY1K2ROjfrx4AVdWVfJE/69n9Gva
	 wjaHAADIVAUnjnVlqgcpcgwzfzs10F3uY8BHYGeDZEgyoIG2nhE6O3MC9i2qTHbY4Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536803;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=koLHkLyvb1uNvdms1z77Rp26vuaer6/1EvoCHN0e7Rk=;
	b=4rJUgeGSFAIGHUIaURiS10a4KdKqmplzUcL3Y+oElHzQ9OB+wXc3GwEk2rF9YN51CD7l
	 mj/cOUzw1nPr4/HAkVBk9n6CPK+1EcqqBmzQOXTTPGr/DUDBYhZS83T9ef2tcWBYhE7j/
	 Wo3bbLE7QFj5THTAVE5py2FZU/SbdOHkDC7Spl2QhNOF/1T1n3DpuhXM1PWsYZAzWJQOe
	 MNSVViNnswVOHJ/fEJmGXNS/Pyy9C3bvM/PZZec9MUek8To6TCtfoKTAe7G4lIL6WRUO8
	 cNe74EDKyXNn4P7zlhyR9h1Tnq+VQqE+aQZkZOcoukMHs/y3oyskvBFBBsRnQ7CJOtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MJf2MzP5;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E99B606A326
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E99B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MJf2MzP5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795536801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=koLHkLyvb1uNvdms1z77Rp26vuaer6/1EvoCHN0e7Rk=;
	b=MJf2MzP51BAZ0WKdKMc8qfbtkmhcQt1r/J28A6ZSLTklWUYp4mrN9aM8s8GfqxLgdo8wlw
	zhyLozS+LM72w8YYz7T7YG4oi1g8+1QNoratKjRkXHH8cpuJ1T024glcGQVLPB+9SbEiNa
	hQv+VUt7NsQxrvh94N5Wjgi6tEHGxXg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-644-Vpg0b3G3O2Oy7t5Xyi3_UQ-1; Tue,
 24 Nov 2026 16:13:16 +0000
X-MC-Unique: Vpg0b3G3O2Oy7t5Xyi3_UQ-1
X-Mimecast-MFC-AGG-ID: Vpg0b3G3O2Oy7t5Xyi3_UQ_1795536794
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DA39B1801343;
	Tue, 24 Nov 2026 16:13:13 +0000 (UTC)
Received: from dhowells-thinkpadp1gen8.rmtgb.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4740C18011DC;
	Tue, 24 Nov 2026 16:13:11 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 00/10] rxrpc: RACK-TLP fixes
Date: Tue, 24 Nov 2026 16:12:48 +0000
Message-ID: <20261124161302.4044422-1-dhowells@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Here are some fixes for AF_RXRPC's RACK-TLP implementation.  It's split
into a number of patches:

 (1) Fix a case of incorrect time unit mixing.

 (2) Fix three cases of integer truncation in time unit conversion.

 (3) Don't carry the in_flight value across (re-)transmission in
     rxrpc_tlp_send_probe().

 (4) Mark reneged ACKs (ie. soft ACK->NAK transition) as lost so that they
     get retransmitted more quickly.

 (5) Fix the RTT calculation for an ACK that's marked lost and then gets
     ACK'd anyway.

 (6) Do the congestion control retransmission timeout procedure when the
     RACK-TLP RTO triggers.  This bit got lost when RACK-TLP was
     implemented.  RXRPC_CALL_RETRANS_TIMEOUT is reduced to providing info
     in the rxrpc_congest tracepoint.

 (7) Fix shadowed limit variable in rxrpc_transmit_fresh_data(), thus
     restricting TLP probes to the number of (sub)packets specified.

 (8) Fix detection of TLP probe responses in a couple of ways: don't detect
     a probe by sequence number if one isn't in flight and check dismissed
     out-of-order ACKs to see if they're TLP probe responses.

 (9) Count in-flight packets directly by tracking them in the rxrpc_txqueue
     structure rather than trying to derive the quantity from values that
     change at different times.  Special handling for TLP probe
     retransmission of an already-ACK'd packet is added (the ACK parse
     ignores re-ACKs of already ACK'd packets) as is TLP probe loss
     handling on RTO expiry.

(10) Fix a number of things in the RACK-TLP code:

     - Make the "in fast recovery" flag available to RACK-TLP code after
       the Reorder timer expires.

     - Arm the RTO timer if no other timer is running and there is unacked
       data and update it if already running and new data ACK'd.

     - Initialise the TLP state in the correct place.

     - Don't reset the xmit timestamp in rxrpc_rack_mark_lost(), but rather
       in the callers where appropriate.

     - Correctly check the flight size.

David

The patches can be found here also:

	http://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git/log/?h=rxrpc-fixes-2

Changes
=======
ver #3)
- Rebased on latest net/main.
- Dropped Reviewed-by/Tested-by tags.
- Sent the RFC number fix separately (to net-next) and dropped from this set.
- Fixed Sashiko-reported bugs[2]:
  - Fixed a time unit mixing bug (comparing us and ns).
  - Fixed a time unit conversion integer overflow bug.
  - Mark reneged ACKs as lost.
  - In rxrpc_tlp_send_probe(), don't carry old tx_in_flight value across
    (re-)transmission.
  - Move the decrementing of tx_in_flight for newly acked packets to
    rxrpc_input_soft_ack_tq().
  - Made RTO timeout notify the congestion algo and cause that to change
    state if appropriate.
  - In rxrpc_rack_update(), handle a packet being marked lost and having
    its xmit_ts reset followed by an ACK arriving anyway.
  - Update the RTO timer if some data is newly acked.
- Fixed other issues (found by eye and also raised by Claude-opus-5-5 run
  locally):
  - Fixed more time unit conversion integer overflow bugs.
  - In rxrpc_transmit_fresh_data(), fixed shadowed limit.
  - Pass TLP probe indication down to packet transmission so that all the
    call->tlp_* bits are set in the same place and so that members aren't
    left unset.
  - Don't consider matching packets (by seq) as TLP probe responses if
    there's no probe in progress.
  - Add a function to end TLP probing, and make that decrement tx_in_flight
    for the TLP probe if it involved a forced retransmission of an already
    acked packet.
  - Added TLP probe/probe response loss detection on RTO expiry and made it
    reset the probe state.
  - Account the in-flight-ness of a TLP probe separately if it's a
    retransmission of an already ACK'd packet.
  - Removed call->tx_nr_sent, ->tx_nr_resent and ->tx_last_serial.

ver #2)
- Rebased on latest net-next/main.
- Fixed Sashiko-reported bugs[1]:
  - When performing TLP_send_probe() [rfc8985 7.3], don't do backoff.  Note
    that backoff may already have been done by rxrpc_resend().
  - In rxrpc_tlp_calc_pto(), clamp call->peer->pmtud_jumbo to be at least
    1.
  - Added a patch to replace the way in which the number of in-flight
    packets is tracked to avoid estimating using values which aren't all
    updated at the same time.

[1] https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260925191520.2206700-1-dhowells%40redhat.com
[2] https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261020201258.290827-1-dhowells%40redhat.com

David Howells (10):
  rxrpc: Fix incorrect unit conversion
  rxrpc: Fix time unit conversion truncation
  rxrpc: Fix carrying of in-flight calc over retransmission
  rxrpc: Fix ack parsing to mark reneged ACKs as lost for RACK-TLP
  rxrpc: Fix RTT processing for a presumed lost packet getting ACK'd
  rxrpc: Fix lost driving of congestion management retransmission
    timeout
  rxrpc: Fix limit on packets to be transmitted in one go
  rxrpc: Fix detection of TLP probe response
  rxrpc: Fix counting of in-flight transmitted packets
  rxrpc: Fix RACK-TLP implementation

 include/trace/events/rxrpc.h |  11 ++-
 net/rxrpc/ar-internal.h      |  42 +++++------
 net/rxrpc/call_event.c       |  54 ++++++++++----
 net/rxrpc/input.c            |  83 ++++++++++++++-------
 net/rxrpc/input_rack.c       | 136 +++++++++++++++++++++++++++--------
 net/rxrpc/output.c           |  22 ++++--
 6 files changed, 246 insertions(+), 102 deletions(-)

